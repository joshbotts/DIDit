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
    @Published var personID: String
    weak var person: PocomPerson?
    @Published var comRole: XmlCOMRole?
    @Published var country: XmlCountry?
    @Published var poRole: XmlPrincipalOfficerRole?
    @Published var startDate: Date?
    @Published var startPrecision: String?
    @Published var startNote: String?
    @Published var chargeDate: Date?
    @Published var chargePrecision: String?
    @Published var chargeNote: String?
    @Published var dutyDate: Date?
    @Published var dutyPrecision: String?
    @Published var dutyNote: String?
    @Published var credentialDate: Date?
    @Published var credentialPrecision: String?
    @Published var credentialNote: String?
    @Published var endDate: Date?
    @Published var endPrecision: String?
    @Published var endNote: String?
    @Published var note: String?
    @Published var creationDate: String?
    @Published var creationBy: String?
    @Published var modificationDate: String?
    @Published var modificationBy: String?
    @Published var createdWith: DataSource = .app
    @Published var provenance: String?
    
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
    
    func startDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "MMMM, yyyy"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch self.startPrecision {
        case "day":
            return "Appointed: " + didDateFormatter.string(from: self.startDate!)
        case "month":
            return "Appointed: " + didDateFormatterMonthPrecision.string(from: self.startDate!)
        case "year":
            return "Appointed: " + didDateFormatterYearPrecision.string(from: self.startDate!)
        default:
            return "No date of appointment identified."
        }
    }
    
    func chargeDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "MMMM, yyyy"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch self.chargePrecision {
        case "day":
            return "Assumed charge: " + didDateFormatter.string(from: self.chargeDate!)
        case "month":
            return "Assumed charge: " + didDateFormatterMonthPrecision.string(from: self.chargeDate!)
        case "year":
            return "Assumed charge: " + didDateFormatterYearPrecision.string(from: self.chargeDate!)
        default:
            return "No date of assumption of charge identified."
        }
    }
    
    func credentialDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "MMMM, yyyy"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch self.credentialPrecision {
        case "day":
            return "Presented credentials: " + didDateFormatter.string(from: self.credentialDate!)
        case "month":
            return "Presented credentials: " + didDateFormatterMonthPrecision.string(from: self.credentialDate!)
        case "year":
            return "Presented credentials: " + didDateFormatterYearPrecision.string(from: self.credentialDate!)
        default:
            return "No date of presentation of credentials identified."
        }
    }
    
    func dutyDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "MMMM, yyyy"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch self.dutyPrecision {
        case "day":
            return "Entry on duty: " + didDateFormatter.string(from: self.dutyDate!)
        case "month":
            return "Entry on duty: " + didDateFormatterMonthPrecision.string(from: self.dutyDate!)
        case "year":
            return "Entry on duty: " + didDateFormatterYearPrecision.string(from: self.dutyDate!)
        default:
            return "No date of entry on duty identified."
        }
    }
    
    func endDateString() -> String {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "MMMM dd, yyyy"
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "MMMM, yyyy"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch self.endPrecision {
        case "day":
            return "Termination of appointment: " + didDateFormatter.string(from: self.endDate!)
        case "month":
            return "Termination of appointment: " + didDateFormatterMonthPrecision.string(from: self.endDate!)
        case "year":
            return "Termination of appointment: " + didDateFormatterYearPrecision.string(from: self.endDate!)
        default:
            return "No date of termination of appointment identified."
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
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "yyyy-MM"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch service.appointedDate?.count {
        case 10:
            self.startDate = didDateFormatter.date(from: service.appointedDate!)
            self.startPrecision = "day"
        case 7:
            self.startDate = didDateFormatterMonthPrecision.date(from: service.appointedDate!)
            self.startPrecision = "month"
        case 4:
            self.startDate = didDateFormatterYearPrecision.date(from: service.appointedDate!)
            self.startPrecision = "year"
        default:
            self.startDate = nil
        }
        self.startNote = service.appointedNote
        switch service.arrivedDate?.count {
        case 10:
            self.chargeDate = didDateFormatter.date(from: service.arrivedDate!)
            self.chargePrecision = "day"
        case 7:
            self.chargeDate = didDateFormatterMonthPrecision.date(from: service.arrivedDate!)
            self.chargePrecision = "month"
        case 4:
            self.chargeDate = didDateFormatterYearPrecision.date(from: service.arrivedDate!)
            self.chargePrecision = "year"
        default:
            self.chargeDate = nil
            self.chargePrecision = nil
        }
        self.chargeNote = service.arrivedNote
        switch service.startedDate?.count {
               case 10:
                   self.credentialDate = didDateFormatter.date(from: service.startedDate!)
                   self.credentialPrecision = "day"
               case 7:
                   self.credentialDate = didDateFormatterMonthPrecision.date(from: service.startedDate!)
                   self.credentialPrecision = "month"
               case 4:
                   self.credentialDate = didDateFormatterYearPrecision.date(from: service.startedDate!)
                   self.credentialPrecision = "year"
               default:
                   self.credentialDate = nil
                   self.credentialPrecision = nil
               }
        self.credentialNote = service.startedNote
        switch service.endedDate?.count {
        case 10:
            self.endDate = didDateFormatter.date(from: service.endedDate!)
            self.endPrecision = "day"
        case 7:
            self.endDate = didDateFormatterMonthPrecision.date(from: service.endedDate!)
            self.endPrecision = "month"
        case 4:
            self.endDate = didDateFormatterYearPrecision.date(from: service.endedDate!)
            self.endPrecision = "year"
        default:
            self.endDate = nil
            self.endPrecision = nil
        }
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
        let didDateFormatterMonthPrecision = DateFormatter()
        didDateFormatterMonthPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterMonthPrecision.dateFormat = "yyyy-MM"
        let didDateFormatterYearPrecision = DateFormatter()
        didDateFormatterYearPrecision.locale = Locale(identifier: "en_US")
        didDateFormatterYearPrecision.dateFormat = "yyyy"
        switch service.appointedDate?.count {
        case 10:
            self.startDate = didDateFormatter.date(from: service.appointedDate!)
            self.startPrecision = "day"
        case 7:
            self.startDate = didDateFormatterMonthPrecision.date(from: service.appointedDate!)
            self.startPrecision = "month"
        case 4:
            self.startDate = didDateFormatterYearPrecision.date(from: service.appointedDate!)
            self.startPrecision = "year"
        default:
            self.startDate = nil
            self.startPrecision = nil
        }
        self.startNote = service.appointedNote
        switch service.startedDate?.count {
        case 10:
            self.dutyDate = didDateFormatter.date(from: service.startedDate!)
            self.dutyPrecision = "day"
        case 7:
            self.dutyDate = didDateFormatterMonthPrecision.date(from: service.startedDate!)
            self.dutyPrecision = "month"
        case 4:
            self.dutyDate = didDateFormatterYearPrecision.date(from: service.startedDate!)
            self.dutyPrecision = "year"
        default:
            self.dutyDate = nil
            self.dutyPrecision = nil
        }
        self.dutyNote = service.startedNote
        switch service.endedDate?.count {
        case 10:
            self.endDate = didDateFormatter.date(from: service.endedDate!)
            self.endPrecision = "day"
        case 7:
            self.endDate = didDateFormatterMonthPrecision.date(from: service.endedDate!)
            self.endPrecision = "month"
        case 4:
            self.endDate = didDateFormatterYearPrecision.date(from: service.endedDate!)
            self.endPrecision = "year"
        default:
            self.endDate = nil
            self.endPrecision = nil
        }
        self.endNote = service.endedNote
        self.note = service.note
        self.modificationDate = service.lastModifiedDate
        self.modificationBy = service.lastModifiedBy
    }
    
    init(poRole: XmlPrincipalOfficerRole, person: PocomPerson, startDate: Date?, startNote: String?, dutyDate: Date?, dutyNote: String?, endDate: Date?, endNote: String?, note: String?, provenance: String?) {
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
        if startDate != nil {
            self.startPrecision = "day"
        } else {
            self.startPrecision = nil
        }
    self.startNote = startNote
    self.dutyDate = dutyDate
        if dutyDate != nil {
            self.dutyPrecision = "day"
        } else {
            self.dutyPrecision = nil
        }
    self.dutyNote = dutyNote
    self.endDate = endDate
        if endDate != nil {
            self.endPrecision = "day"
        } else {
            self.endPrecision = nil
        }
    self.endNote = endNote
    self.note = note
    self.provenance = provenance
}
    init(comRole: XmlCOMRole, country: XmlCountry, person: PocomPerson, startDate: Date?, startNote: String?, chargeDate: Date?, chargeNote: String?, credentialDate: Date?, credentialNote: String?, endDate: Date?, endNote: String?, note: String?, provenance: String?) {
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
        if startDate != nil {
            self.startPrecision = "day"
        } else {
            self.startPrecision = nil
        }
        self.startNote = startNote
        self.chargeDate = chargeDate
        if chargeDate != nil {
            self.chargePrecision = "day"
        } else {
            self.chargePrecision = nil
        }
        self.chargeNote = chargeNote
        self.credentialDate = credentialDate
        if credentialDate != nil {
            self.credentialPrecision = "day"
        } else {
            self.credentialPrecision = nil
        }
        self.credentialNote = credentialNote
        self.endDate = endDate
        if endDate != nil {
            self.endPrecision = "day"
        } else {
            self.endPrecision = nil
        }
        self.endNote = endNote
        self.note = note
        self.provenance = provenance
    }
    
    func exportChiefSCSV() -> String {
        return "chief of mission; \(self.country!.getCountryName()); \(self.comRole!.getTitle()); \(self.person!.getDisplayName()); \(self.startDateString()); \(self.chargeDateString()); \(self.credentialDateString()); \(self.endDateString())"
    }
    
    func exportChiefFullCSV() -> String? {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
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
        // person id; role; country; appointment date; charge date; credential date; end date; note
        if (self.startDate != nil || self.chargeDate != nil || self.credentialDate != nil || self.endDate != nil) {
            return "\(self.person!.getExportName()); \(self.comRole!.getTitle()); \(self.country!.getCountryName()); \(exportStartDate); \(exportChargeDate); \(exportCredentialDate); \(exportEndDate); \(self.note ?? "")"
        } else {
            return nil
        }
    }
    
    func exportChiefFullEscapedCSV() -> String? {
        func escapeCommas(_ a: String?) -> String {
            if a != nil {
                if a!.contains(",") {
                    return "\"\(a!)\""
                } else {
                    return a!
                }
            } else {
                return ""
            }
        }
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
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
        // person id; role; country; appointment date; charge date; credential date; end date; note
        if (self.startDate != nil || self.chargeDate != nil || self.credentialDate != nil || self.endDate != nil) {
            return "\(escapeCommas(self.person!.getExportName())); \(escapeCommas(self.comRole!.getTitle())); \(escapeCommas(self.country!.getCountryName())); \(exportStartDate); \(exportChargeDate); \(exportCredentialDate); \(exportEndDate); \(escapeCommas(self.note))"
        } else {
            return nil
        }
    }
    
    func exportChiefXMLForAirTable() -> String? {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
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
        
        if (self.startDate != nil || self.chargeDate != nil || self.credentialDate != nil || self.endDate != nil) {
            print("\(self.id) exported")
            return """
            <diplomaticPosition>
            <person>\(self.person!.getExportName())</person>
            <diplomaticRole>\(self.comRole!.getTitle())</domesticRole>
            <countryAccredited>\(self.country!.getCountryName())</countryAccredited>
            <startDate>\(exportStartDate)</startDate>
            <chargeDate>\(exportChargeDate)</chargeDate>
            <credentialDate>\(exportCredentialDate)</credentialDate>
            <endDate>\(exportEndDate)</endDate>
            <note>\(self.note ?? "")</note>
            <diplomaticPosition>
            """
        } else {
            return nil
        }
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
    
    func exportChiefJson() -> String {
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
        return """
        {
            "id": "\(self.id)",
            "personID": "\(self.personID)",
            "roleTitleID": "\(self.comRole!.rawValue)",
            "contemporaryTerritoryID": "\(self.country!.rawValue)",
            "appointedDate": "\(exportStartDate)",
            "appointedNote": "\(self.startNote ?? "")",
            "arrivedDate": "\(exportChargeDate)",
            "arrivedNote": "\(self.chargeNote ?? "")",
            "startedDate": "\(exportCredentialDate)",
            "startedNote": "\(self.credentialNote ?? "")",
            "endedDate": "\(exportEndDate)",
            "endedNote": "\(self.endNote ?? "")",
            "note": "\(self.note ?? "")",
            "createdBy": "\(self.creationBy ?? "DIDit.app")",
            "createdDate": "\(self.creationDate ?? currentDateString)",
            "lastModifiedBy": "\(self.modificationBy ?? "DIDit.app")",
            "lastModifiedDate": "\(currentDateString)"
        }
        """
    }
    
    func exportPrincipalSCSV() -> String {
        return "principal officer; \(self.poRole!.getPORoleName()); \(self.person!.getDisplayName()); \(self.startDateString()); \(self.dutyDateString()); \(self.endDateString())"
    }
    
    func exportPrincipalFullEscapedCSV() -> String? {
        func escapeCommas(_ a: String?) -> String {
            if a != nil {
                if a!.contains(",") {
                    return "\"\(a!)\""
                } else {
                    return a!
                }
            } else {
                return ""
            }
        }
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        var exportStartDate = ""
        var exportDutyDate = ""
        var exportEndDate = ""
        if self.startDate != nil {
            exportStartDate = didDateFormatter.string(from: self.startDate!)
        }
        if self.dutyDate != nil {
            exportDutyDate = didDateFormatter.string(from: self.dutyDate!)
        }
        if self.endDate != nil {
            exportEndDate = didDateFormatter.string(from: self.endDate!)
        }
        // person id; role; appointment date; duty date; end date; note
        if (self.startDate != nil || self.dutyDate != nil || self.endDate != nil) {
            return "\(escapeCommas(self.person!.getExportName())); \(escapeCommas(self.poRole!.getPORoleName())); \(exportStartDate); \(exportDutyDate); \(exportEndDate); \(escapeCommas(self.note))"
        } else {
            return nil
        }
    }
    
    
    func exportPrincipalFullCSV() -> String? {
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        var exportStartDate = ""
        var exportDutyDate = ""
        var exportEndDate = ""
        if self.startDate != nil {
            exportStartDate = didDateFormatter.string(from: self.startDate!)
        }
        if self.dutyDate != nil {
            exportDutyDate = didDateFormatter.string(from: self.dutyDate!)
        }
        if self.endDate != nil {
            exportEndDate = didDateFormatter.string(from: self.endDate!)
        }
        // person id; role; appointment date; duty date; end date; note
        if (self.startDate != nil || self.dutyDate != nil || self.endDate != nil) {
            return "\(self.person!.getExportName()); \(self.poRole!.getPORoleName()); \(exportStartDate); \(exportDutyDate); \(exportEndDate); \(self.note ?? "")"
        } else {
            return nil
        }
    }
    
    func exportPrincipalXMLForAirTable() -> String? {
            let didDateFormatter = DateFormatter()
            didDateFormatter.locale = Locale(identifier: "en_US")
            didDateFormatter.dateFormat = "yyyy-MM-dd"
            var exportStartDate = ""
            var exportDutyDate = ""
            var exportEndDate = ""
            if self.startDate != nil {
                exportStartDate = didDateFormatter.string(from: self.startDate!)
            }
            if self.dutyDate != nil {
                exportDutyDate = didDateFormatter.string(from: self.dutyDate!)
            }
            if self.endDate != nil {
                exportEndDate = didDateFormatter.string(from: self.endDate!)
            }
            if (self.startDate != nil || self.dutyDate != nil || self.endDate != nil) {
                print("\(self.id) exported")
                return """
                <domesticPosition>
                <person>\(self.person!.getExportName())</person>
                <domesticRole>\(self.poRole!.getPORoleName())</domesticRole>
                <startDate>\(exportStartDate)</startDate>
                <dutyDate>\(exportDutyDate)</dutyDate>
                <endDate>\(exportEndDate)</endDate>
                <note>\(self.note ?? "")</note>
                </domesticPosition>
                """
            } else {
                return nil
            }
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
    
    func exportPrincipalJson() -> String {
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
        return """
        {
            "id": "\(self.id)",
            "personID": "\(self.personID)",
            "roleTitleID": "\(self.poRole!.rawValue)",
            "appointedDate": "\(exportStartDate)",
            "appointedNote": "\(self.startNote ?? "")",
            "startedDate": "\(exportDutyDate)",
            "startedNote": "\(self.dutyNote ?? "")",
            "endedDate": "\(exportEndDate)",
            "endedNote": "\(self.endNote ?? "")",
            "note": "\(self.note ?? "")",
            "createdBy": "\(self.creationBy ?? "DIDit.app")",
            "createdDate": "\(self.creationDate ?? currentDateString)",
            "lastModifiedBy": "\(self.modificationBy ?? "DIDit.app")",
            "lastModifiedDate": "\(currentDateString)"
        }
        """
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
        try container.encode(creationBy, forKey: .creationBy)
        try container.encode(creationDate, forKey: .creationDate)
        try container.encode(modificationBy, forKey: .modificationBy)
        try container.encode(modificationDate, forKey: .modificationDate)
        try container.encode(createdWith.rawValue, forKey: .createdWith)
        try container.encode(provenance, forKey: .provenance)
    }
    
    deinit {
        print("POCOM Instance \(self.id) deinitialized.")
    }
}
