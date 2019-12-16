//
//  PocomInstance.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

final class PocomInstance: Identifiable, Codable, ObservableObject {
    @Published var instanceType: PocomInstanceType
    @Published var id: String
//    var idComputed: String {
//        if self.instanceType == PocomInstanceType.chief {
//            var id = self.country!.getCountryCode()
//            if startDate != nil {
//                let didDateFormatter = DateFormatter()
//                didDateFormatter.locale = Locale(identifier: "en_US")
//                didDateFormatter.dateFormat = "yyyy-MM-dd"
//                let startDateString = didDateFormatter.string(from: startDate!)
//                let startYear = startDateString.prefix(4)
//                id += "-\(startYear)-\(person.id.prefix(4))"
//            } else {
//                id += "-----\(person.id.prefix(4))"
//            }
//            return id.lowercased()}
//        else {
//            var id = self.poRole!.getPORoleCode()
//            if startDate != nil {
//                let didDateFormatter = DateFormatter()
//                didDateFormatter.locale = Locale(identifier: "en_US")
//                didDateFormatter.dateFormat = "yyyy-MM-dd"
//                let startDateString = didDateFormatter.string(from: startDate!)
//                let startYear = startDateString.prefix(4)
//                id += "-\(startYear)-\(person.id.prefix(4))"
//            } else {
//                id += "-----\(person.id.prefix(4))"
//            }
//            return id.lowercased()
//        }
//    }
//    var id: String {
//        if idFromService != nil {
//            return idFromService!
//        } else {
//            return idComputed
//        }
//    }
    // ensures that pocom instance id from xml is used whenever available, but that computed property ready to go for app-generated instances (id parameter required for compliance with identifiable protocol, which is required for deployment in list views)
    @Published var personID: String
    // ensures that person ID associated with pocom instance reflects existing values in xml whenever available. only uses computed property of assigned person parameter if person instance was initialized by the app itself (which would ensure that the person.id parameter would be aligned between the person instance and pocom instance).
    weak var person: PocomPerson?
//    {
//        let pocomStore = PocomStore()
//        return pocomStore.personForInstance(instance: self)
//    }
    @Published var comRole: XmlCOMRole?
    @Published var country: XmlCountry?
//    var instanceRole: String {
//        if self.instanceType == .chief {
//            return String(self.comRole!.getTitle() + " to " + self.country!.getCountryName())
//        } else if self.instanceType == .principal {
//            return String(self.poRole!.getPORoleName())
//        } else {
//            return "No role identified."
//        }
//    }
    // needed unified role parameter for displayed heterogenous information for different (sub)types of pocom instances in the person detail views. defaul of "no role identified" should never be used.
    @Published var poRole: XmlPrincipalOfficerRole?
    @Published var startDate: Date?
    // appointment date
    @Published var startNote: String?
    @Published var chargeDate: Date?
    // date of arrival at post or transfer of authority to CDA. for .type=chief
    @Published var chargeNote: String?
    @Published var dutyDate: Date?
    // entry on duty date. for .type=principal
    @Published var dutyNote: String?
    @Published var credentialDate: Date?
    // for .type=chief
    @Published var credentialNote: String?
    @Published var endDate: Date?
    // termination of appointment
    @Published var endNote: String?
    // to add any desired editorial comment or explanation of circumstances for termination of role (reorganization of bureaus)
    @Published var note: String?
    @Published var nominationDate: Date?
    // only for failed nomination
    @Published var nominationEndDate: Date?
    // only for failed nomination - date of withdrawal, rejection, or return of nomination
    @Published var nominationNote: String?
    // only for failed nomination - statement of type of nomination failure
    @Published var careerFsoOverride: Career?
    // use in cases when career foreign service officer with a pocom role leaves the foreign service and is later appointed to additional pocom roles (e.g. Lawrence Eagleberger (D and S) and George Kennan (Amb to Yugoslavia in Kennedy admin). allows for per-instance reporting of career status while maintaining default value for property in person struct.
    @Published var stateOfResidenceOverride: USState?
    // use in cases where pocom person state of residence changes from initial value. defaults to nil.
    @Published var creationDate: String?
    @Published var creationBy: String?
    @Published var modificationDate: String?
    @Published var modificationBy: String?
    @Published var createdWith: DataSource = .app
    @Published var provenance: String?
    
//    var sortDate: Date {
//        let didDateFromIDFormatter = DateFormatter()
//        didDateFromIDFormatter.locale = Locale(identifier: "en_US")
//        didDateFromIDFormatter.dateFormat = "yyyy"
//        let dateStringFromID = String((self.id.prefix(7)).suffix(4))
//        let dateStringFromOrg4ID = String((self.id.prefix(9)).suffix(4))
//        let dateStringFromOrg3ID = String((self.id.prefix(8)).suffix(4))
//        if startDate != nil {
//            return startDate!
//        } else if nominationDate != nil {
//            return nominationDate!
//        } else if Int(dateStringFromID) != nil {
//            return didDateFromIDFormatter.date(from: dateStringFromID)!
//        } else if Int(dateStringFromOrg4ID) != nil {
//        return didDateFromIDFormatter.date(from: dateStringFromOrg4ID)!
//        } else if Int(dateStringFromOrg3ID) != nil {
//        return didDateFromIDFormatter.date(from: dateStringFromOrg3ID)!
//        } else {
//            return didDateFromIDFormatter.date(from: "9999")!
//        }
//    }
    // sort date needed to properly order pocom instance rows in person detail view and within chief and principal subviews (by country and role, respectively). start date is preferred sourcce of sort date. nomination dates can be used once they are extracted from notes. the date string from ID conditionals attempt to extract years from the pocom instance ids (which have variable length prefixes among the chiefs-orgs roles). the default value of "9999" is used to ensure instances where none of these methoids work (usually a failed nomination) are positioned at the end of whatever list they are being placed within.
    
    enum PocomInstanceType: String, RawRepresentable {
        case chief, principal
    }
    
    func instanceRole() -> String {
        if self.instanceType == .chief {
            return String(self.comRole!.getTitle() + " to " + self.country!.getCountryName())
        } else if self.instanceType == .principal {
            return String(self.poRole!.getPORoleName())
        } else {
            return "No role identified."
        }
    }
    
    func makeID(instanceType: PocomInstanceType, country: XmlCountry?, person: PocomPerson, role: XmlPrincipalOfficerRole?, startDate: Date?) -> String {
        if instanceType == PocomInstanceType.chief {
            var id = country!.getCountryCode()
            if startDate != nil {
                let didDateFormatter = DateFormatter()
                didDateFormatter.locale = Locale(identifier: "en_US")
                didDateFormatter.dateFormat = "yyyy-MM-dd"
                let startDateString = didDateFormatter.string(from: startDate!)
                let startYear = startDateString.prefix(4)
                id += "-\(startYear)-\(person.id.prefix(4))-01"
            } else {
                id += "-----\(person.id.prefix(4))-01"
            }
            return id.lowercased()}
        else {
            var id = role!.getPORoleCode()
            if startDate != nil {
                let didDateFormatter = DateFormatter()
                didDateFormatter.locale = Locale(identifier: "en_US")
                didDateFormatter.dateFormat = "yyyy-MM-dd"
                let startDateString = didDateFormatter.string(from: startDate!)
                let startYear = startDateString.prefix(4)
                id += "-\(startYear)-\(person.id.prefix(4))"
            } else {
                id += "-----\(person.id.prefix(4))"
            }
            return id.lowercased()
        }
    }
    
    func sortDate() -> Date {
        let didDateFromIDFormatter = DateFormatter()
        didDateFromIDFormatter.locale = Locale(identifier: "en_US")
        didDateFromIDFormatter.dateFormat = "yyyy"
        let dateStringFromID = String((self.id.prefix(7)).suffix(4))
        let dateStringFromOrg4ID = String((self.id.prefix(9)).suffix(4))
        let dateStringFromOrg3ID = String((self.id.prefix(8)).suffix(4))
        if startDate != nil {
            return startDate!
        } else if nominationDate != nil {
            return nominationDate!
        } else if Int(dateStringFromID) != nil {
            return didDateFromIDFormatter.date(from: dateStringFromID)!
        } else if Int(dateStringFromOrg4ID) != nil {
        return didDateFromIDFormatter.date(from: dateStringFromOrg4ID)!
        } else if Int(dateStringFromOrg3ID) != nil {
        return didDateFromIDFormatter.date(from: dateStringFromOrg3ID)!
        } else {
            return didDateFromIDFormatter.date(from: "9999")!
        }
    }
    
//    static let didDateFormatter: DateFormatter = {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "en_US")
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        return dateFormatter
//    }()
    
    func startDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        if self.startDate != nil {
            return "Appointed: " + didDateFormatter.string(from: self.startDate!)
        } else {
            return "No date of appointment identified."
        }
    }
    func chargeDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        if self.chargeDate != nil {
            return "Assumed charge: " + didDateFormatter.string(from: self.chargeDate!)
        } else {
            return "No date of assumption of charge identified"
        }
    }
    func credentialDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        if self.credentialDate != nil {
            return "Presented credentials: " + didDateFormatter.string(from: self.credentialDate!)
        } else {
            return "No date of presentation of credentials identified"
        }
    }
    func dutyDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        if self.dutyDate != nil {
            return "Entry on duty: " + didDateFormatter.string(from: self.dutyDate!)
        } else {
            return "No date of entry on duty identified"
        }
    }
    func endDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        if self.endDate != nil {
            return "Termination of appointment: " + didDateFormatter.string(from: self.endDate!)
        } else {
            return "No date of termination of appointment identified"
        }
    }
    
    init(id: String, personID: String, type: PocomInstanceType) {
        self.id = id
        self.personID = personID
        self.instanceType = type
    }
    
    init(from service: ChiefOfMissionInstanceFromJson) {
        self.createdWith = .json
        self.instanceType = PocomInstanceType.chief
        self.comRole = XmlCOMRole.init(rawValue: service.roleTitleID)!
        self.country = XmlCountry.init(rawValue: service.contemporaryTerritoryID)!
        self.creationDate = service.createdDate
        self.creationBy = service.createdBy
        self.personID = service.personID
        self.id = service.id
        self.creationDate = service.createdDate
        self.creationBy = service.createdBy
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        self.startDate = didDateFormatter.date(from: service.appointedDate ?? "")
        self.startNote = service.appointedNote
        self.chargeDate = didDateFormatter.date(from: service.arrivedDate ?? "")
        self.chargeNote = service.arrivedNote
        self.credentialDate = didDateFormatter.date(from: service.startedDate ?? "")
        self.credentialNote = service.startedNote
        self.endDate = didDateFormatter.date(from: service.endedDate ?? "")
        self.endNote = service.endedNote
        self.note = service.note
        self.modificationDate = service.lastModifiedDate
        self.modificationBy = service.lastModifiedBy
    }
    
    init(from service: PrincipalOfficerInstanceFromJson) {
        self.createdWith = .json
        self.instanceType = PocomInstanceType.principal
        self.poRole = XmlPrincipalOfficerRole.init(rawValue: service.roleTitleID)!
        self.creationDate = service.createdDate
        self.creationBy = service.createdBy
        self.personID = service.personID
        self.id = service.id
        self.creationDate = service.createdDate
        self.creationBy = service.createdBy
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        self.startDate = didDateFormatter.date(from: service.appointedDate ?? "")
        self.startNote = service.appointedNote
        self.dutyDate = didDateFormatter.date(from: service.startedDate ?? "")
        self.dutyNote = service.startedNote
        self.endDate = didDateFormatter.date(from: service.endedDate ?? "")
        self.endNote = service.endedNote
        self.note = service.note
        self.modificationDate = service.lastModifiedDate
        self.modificationBy = service.lastModifiedBy
    }
    
    init(poRole: XmlPrincipalOfficerRole, person: PocomPerson, startDate: Date?, startNote: String?, dutyDate: Date?, dutyNote: String?, endDate: Date?, endNote: String?, note: String?, career: Career?, stateOfResidence: USState?, provenance: String?) {
        let currentDate = Date()
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = didDateFormatter.string(from: currentDate)
        var id = poRole.getPORoleCode()
            if startDate != nil {
                let startDateString = didDateFormatter.string(from: startDate!)
                let startYear = startDateString.prefix(4)
                id += "-\(startYear)-\(person.id.prefix(4))"
            } else {
                id += "-----\(person.id.prefix(4))"
            }
    self.id = id.lowercased()
    self.creationBy = "DIDit.app"
    self.creationDate = currentDateString
    self.modificationBy = "DIDit.app"
    self.modificationDate = currentDateString
    self.createdWith = DataSource.app
    self.instanceType = PocomInstanceType.principal
    self.poRole = poRole
    self.personID = person.id
    self.startDate = startDate
    self.startNote = startNote
    self.dutyDate = dutyDate
    self.dutyNote = dutyNote
    self.endDate = endDate
    self.endNote = endNote
    self.note = note
    self.careerFsoOverride = career
    self.stateOfResidenceOverride = stateOfResidence
    self.provenance = provenance
}
    init(comRole: XmlCOMRole, country: XmlCountry, person: PocomPerson, startDate: Date?, startNote: String?, chargeDate: Date?, chargeNote: String?, credentialDate: Date?, credentialNote: String?, endDate: Date?, endNote: String?, note: String?, career: Career?, stateOfResidence: USState?, provenance: String?) {
            let currentDate = Date()
            let didDateFormatter = DateFormatter()
            didDateFormatter.locale = Locale(identifier: "en_US")
            didDateFormatter.dateFormat = "yyyy-MM-dd"
            let currentDateString = didDateFormatter.string(from: currentDate)
            var id = country.getCountryCode()
            if startDate != nil {
                let startDateString = didDateFormatter.string(from: startDate!)
                let startYear = startDateString.prefix(4)
                id += "-\(startYear)-\(person.id.prefix(4))-01"
            } else {
                id += "-----\(person.id.prefix(4))-01"
            }
        self.id = id.lowercased()
        self.creationBy = "DIDit.app"
        self.creationDate = currentDateString
        self.modificationBy = "DIDit.app"
        self.modificationDate = currentDateString
        self.createdWith = DataSource.app
        self.instanceType = PocomInstanceType.chief
        self.comRole = comRole
        self.country = country
        self.personID = person.id
        self.startDate = startDate
        self.startNote = startNote
        self.chargeDate = chargeDate
        self.chargeNote = chargeNote
        self.credentialDate = credentialDate
        self.credentialNote = credentialNote
        self.endDate = endDate
        self.endNote = endNote
        self.note = note
        self.careerFsoOverride = career
        self.stateOfResidenceOverride = stateOfResidence
        self.provenance = provenance
    }
    
    func exportChiefSCSV() -> String {
        return "country: \(self.country!); role: \(self.comRole!); person: \(self.personID); \(self.startDateString()); \(self.chargeDateString()); \(self.credentialDateString()); \(self.endDateString())"
    }
    
    func exportChiefElement() -> String {
        let currentDate = Date()
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = didDateFormatter.string(from: currentDate)
        var exportStartDate = ""
        var exportChargeDate = ""
        var exportCredentialDate = ""
        var exportEndDate = ""
        if self.startDate != nil {
            exportStartDate = didDateFormatter.string(from: self.startDate!)
        }
        if self.chargeDate != nil {
            exportChargeDate = didDateFormatter.string(from: self.chargeDate!)
        }
        if self.credentialDate != nil {
            exportCredentialDate = didDateFormatter.string(from: self.credentialDate!)
        }
        if self.endDate != nil {
            exportEndDate = didDateFormatter.string(from: self.endDate!)
        }
        let exportElement = """
        (: provenance: \(self.provenance ?? "No provenance provided"):)
        (: paste into \(self.country!.rawValue).xml :)
        <chief>
        <id>\(self.id)</id>
        <person-id>\(self.personID)</person-id>
        <role-title-id>\(self.comRole!.rawValue)</role-title-id>
        <contemporary-territory-id>\(self.country!.rawValue)</contemporary-territory-id>
        <appointed>
        <date>\(exportStartDate)</date>
        <note>\(self.startNote ?? "")</note>
        </appointed>
        <arrived>
        <date>\(exportChargeDate)</date>
        <note>\(self.chargeNote ?? "")</note>
        </arrived>
        <started>
        <date>\(exportCredentialDate)</date>
        <note>\(self.credentialNote ?? "")</note>
        </started>
        <ended>
        <date>\(exportEndDate)</date>
        <note>\(self.endNote ?? "")</note>
        </ended>
        <note>\(self.note ?? "")</note>
        <created-by>\(self.creationBy ?? "DIDit.app")</created-by>
        <created-date>\(self.creationDate ?? currentDateString)</created-date>
        <last-modified-by>\(self.modificationBy ?? "DIDit.app")</last-modified-by>
        <last-modified-date>\(currentDateString)</last-modified-date>
        </chief>
        """
        return exportElement
    }
    
    func exportPrincipalElement() -> String {
        let currentDate = Date()
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        var exportStartDate = ""
        var exportDutyDate = ""
        var exportEndDate = ""
        let currentDateString = didDateFormatter.string(from: currentDate)
        if self.startDate != nil {
            exportStartDate = didDateFormatter.string(from: self.startDate!)
        }
        if self.dutyDate != nil {
            exportDutyDate = didDateFormatter.string(from: self.dutyDate!)
        }
        if self.endDate != nil {
            exportEndDate = didDateFormatter.string(from: self.endDate!)
        }
        let exportElement = """
        (: provenance: \(self.provenance ?? "No provenance provided"):)
        (: paste into \(self.poRole!.rawValue).xml :)
        <principal>
        <id>\(self.id)</id>
        <person-id>\(self.personID)</person-id>
        <role-title-id>\(self.poRole!.rawValue)</role-title-id>
        <appointed>
        <date>\(exportStartDate)</date>
        <note>\(self.startNote ?? "")</note>
        </appointed>
        <started>
        <date>\(exportDutyDate)</date>
        <note>\(self.dutyNote ?? "")</note>
        </started>
        <ended>
        <date>\(exportEndDate)</date>
        <note>\(self.endNote ?? "")</note>
        </ended>
        <note>\(self.note ?? "")</note>
        <created-by>\(self.creationBy ?? "DIDit.app")</created-by>
        <created-date>\(self.creationDate ?? currentDateString)</created-date>
        <last-modified-by>\(self.modificationBy ?? "DIDit.app")</last-modified-by>
        <last-modified-date>\(currentDateString)</last-modified-date>
        </principal>
        """
        return exportElement
    }
    
    private enum CodingKeys: String, CodingKey {
        case instanceType
        case id
        case personID
        case comRole
        case country
        case poRole
        case startDate
        case startNote
        case chargeDate
        case chargeNote
        case dutyDate
        case dutyNote
        case credentialDate
        case credentialNote
        case endDate
        case endNote
        case note
        case nominationDate
        case nominationEndDate
        case nominationNote
        case careerFsoOverride
        case stateOfResidenceOverride
        case creationDate
        case creationBy
        case modificationDate
        case modificationBy
        case createdWith
        case provenance
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decodeIfPresent(String.self, forKey: .instanceType)
        self.instanceType = PocomInstanceType(rawValue: type!)!
        self.id = try container.decodeIfPresent(String.self, forKey: .id)!
        self.personID = try container.decodeIfPresent(String.self, forKey: .personID)!
        let comRoleWrapped = try container.decodeIfPresent(String.self, forKey: .comRole)
        if comRoleWrapped != nil {
            self.comRole = XmlCOMRole(rawValue: comRoleWrapped!)!
        }
        let countryWrapped = try container.decodeIfPresent(String.self, forKey: .country)
        if countryWrapped != nil {
            self.country = XmlCountry(rawValue: countryWrapped!)!
        }
        let poRoleWrapped = try container.decodeIfPresent(String.self, forKey: .poRole)
        if poRoleWrapped != nil {
            self.poRole = XmlPrincipalOfficerRole(rawValue: poRoleWrapped!)!
        }
        self.startDate = try container.decodeIfPresent(Date.self, forKey: .startDate)
        self.startNote = try container.decodeIfPresent(String.self, forKey: .startNote)
        self.chargeDate = try container.decodeIfPresent(Date.self, forKey: .chargeDate)
        self.chargeNote = try container.decodeIfPresent(String.self, forKey: .chargeNote)
        self.dutyDate = try container.decodeIfPresent(Date.self, forKey: .dutyDate)
        self.dutyNote = try container.decodeIfPresent(String.self, forKey: .dutyNote)
        self.credentialDate = try container.decodeIfPresent(Date.self, forKey: .credentialDate)
        self.credentialNote = try container.decodeIfPresent(String.self, forKey: .credentialNote)
        self.endDate = try container.decodeIfPresent(Date.self, forKey: .endDate)
        self.endNote = try container.decodeIfPresent(String.self, forKey: .endNote)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.nominationDate = try container.decodeIfPresent(Date.self, forKey: .nominationDate)
        self.nominationEndDate = try container.decodeIfPresent(Date.self, forKey: .nominationEndDate)
        self.nominationNote = try container.decodeIfPresent(String.self, forKey: .nominationNote)
        let career = try container.decodeIfPresent(String.self, forKey: .careerFsoOverride)
        if career != nil {
        self.careerFsoOverride = Career(rawValue: career!)!
        }
        let state = try container.decodeIfPresent(String.self, forKey: .stateOfResidenceOverride)
        if state != nil {
            self.stateOfResidenceOverride = USState(rawValue: state!)!
        }
        self.creationBy = try container.decodeIfPresent(String.self, forKey: .creationBy)
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate)
        self.modificationBy = try container.decodeIfPresent(String.self, forKey: .modificationBy)
        self.modificationDate = try container.decodeIfPresent(String.self, forKey: .modificationDate)
        let userAgent = try container.decodeIfPresent(String.self, forKey: .createdWith)
        self.createdWith = DataSource(rawValue: userAgent!)!
        self.provenance = try container.decodeIfPresent(String.self, forKey: .provenance)
    }
    
    public func encode(to encoder: Encoder) throws {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(instanceType.rawValue, forKey: .instanceType)
        try container.encode(id, forKey: .id)
        try container.encode(personID, forKey: .personID)
        try container.encode(comRole?.rawValue, forKey: .comRole)
        try container.encode(country?.rawValue, forKey: .country)
        try container.encode(poRole?.rawValue, forKey: .poRole)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(startNote, forKey: .startNote)
        try container.encode(chargeDate, forKey: .chargeDate)
        try container.encode(chargeNote, forKey: .chargeNote)
        try container.encode(dutyDate, forKey: .dutyDate)
        try container.encode(dutyNote, forKey: .dutyNote)
        try container.encode(credentialDate, forKey: .credentialDate)
        try container.encode(credentialNote, forKey: .credentialNote)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(endNote, forKey: .endNote)
        try container.encode(note, forKey: .note)
        try container.encode(nominationDate, forKey: .nominationDate)
        try container.encode(nominationEndDate, forKey: .nominationEndDate)
        try container.encode(nominationNote, forKey: .nominationNote)
        try container.encode(careerFsoOverride?.rawValue, forKey: .careerFsoOverride)
        try container.encode(stateOfResidenceOverride?.rawValue, forKey: .stateOfResidenceOverride)
        try container.encode(creationBy, forKey: .creationBy)
        try container.encode(creationDate, forKey: .creationDate)
        try container.encode(modificationBy, forKey: .modificationBy)
        try container.encode(modificationDate, forKey: .modificationDate)
        try container.encode(createdWith.rawValue, forKey: .createdWith)
        try container.encode(provenance, forKey: .provenance)
    }
    
    deinit {
    print("POCOM Instance deinitialized.")
    }
}
