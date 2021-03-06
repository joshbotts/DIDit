//
//  PocomPerson.swift
//  DID IT
//
//  Created by Joshua Botts on 9/19/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

final class PocomPerson: Identifiable, Codable, ObservableObject {
    @Published var id: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var middleName: String?
    @Published var genName: String?
    @Published var altName: String?
    @Published var birthYear: Int?
    @Published var deathYear: Int?
    @Published var career: Career?
    @Published var stateOfResidence: USState?
    @Published var creationDate: String?
    @Published var creationBy: String?
    @Published var modificationDate: String?
    @Published var modificationBy: String?
    @Published var createdWith: DataSource = .app
    @Published var provenance: String?
    
    init(id: String, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
    init(from service: PocomPersonFromJson) {
        self.createdWith = .json
        self.firstName = service.forename.components(separatedBy: " ").first!
        self.lastName = service.surname
        let jsonForenameComponents = service.forename.components(separatedBy: " ")
        let jsonMiddleNameComponents = jsonForenameComponents.dropFirst()
        self.middleName = jsonMiddleNameComponents.joined(separator: " ")
        self.genName = service.genName
        self.altName = service.altname
        self.birthYear = service.birth
        self.deathYear = service.death
        let jsonCareer = service.careerType
        if jsonCareer == "career" {
            self.career = .careerFSO
        } else if jsonCareer == "non-career" {
            self.career = .nonCareer
        } else if jsonCareer == "pre-1915" {
            self.career = .pre1915
        }
        self.stateOfResidence = USState.init(rawValue: service.stateID ?? "")
        self.id = service.id
        self.creationDate = service.createdDate
        self.creationBy = service.createdBy
        self.modificationDate = service.lastModifiedDate
        self.modificationBy = service.lastModifiedBy
    }
    
    init(firstName: String, lastName: String, middleName: String?, genName: String?, altName: String?, birthYear: Int?, deathYear: Int?, career: Career?, stateOfResidence: USState?, provenance: String?) {
        var id: String {
            var idFirstName = ""
            var idLastName = ""
            if firstName.contains(" ") {
                idFirstName = firstName.replacingOccurrences(of: " ", with: "-")
            } else {
                idFirstName = firstName
            }
            if lastName.contains(" ") {
                idLastName = lastName.replacingOccurrences(of: " ", with: "-")
            } else {
                idLastName = lastName
            }
            var id = "\(idLastName)-\(idFirstName)"
            if middleName != nil {
                if middleName!.contains(".") {
                    id += "-\(middleName!.dropLast())"
                } else if middleName!.contains(" ") {
                        id += "-\(middleName!.replacingOccurrences(of: " ", with: "-"))"
                    } else {
                        id += "-\(middleName!)"
                    }
                }
            if genName != nil {
                if genName!.contains(".") {
                id += "-\(genName!.dropLast())"
                }  else {
            id += "-\(genName!)"
            }
            }
            return id.lowercased()
        }
        self.id = id
        let currentDate = Date()
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = didDateFormatter.string(from: currentDate)
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.genName = genName
        self.altName = altName
        if birthYear != nil {
        self.birthYear = Int(birthYear!)
        } else {
            self.birthYear = nil
        }
        if deathYear != nil {
        self.deathYear = Int(deathYear!)
        } else {
            self.deathYear = nil
        }
        self.career = career
        self.stateOfResidence = stateOfResidence
        self.creationBy = "DIDit.app"
        self.creationDate = currentDateString
        self.modificationBy = "DIDit.app"
        self.modificationDate = currentDateString
        self.createdWith = DataSource.app
        self.provenance = provenance
    }
    
    func makeID(firstName: String, middleName: String?, lastName: String, genName: String?) -> String {
            var idFirstName = ""
            var idLastName = ""
            if firstName.contains(" ") {
                idFirstName = firstName.replacingOccurrences(of: " ", with: "-")
            } else {
                idFirstName = firstName
            }
            if lastName.contains(" ") {
                idLastName = lastName.replacingOccurrences(of: " ", with: "-")
            } else {
                idLastName = lastName
            }
            var id = "\(idLastName)-\(idFirstName)"
            if middleName != nil {
                if middleName!.contains(".") {
                    id += "-\(middleName!.dropLast())"
                } else if middleName!.contains(" ") {
                        id += "-\(middleName!.replacingOccurrences(of: " ", with: "-"))"
                    } else {
                        id += "-\(middleName!)"
                    }
                }
            if genName != nil {
                if genName!.contains(".") {
                id += "-\(genName!.dropLast())"
                }  else {
            id += "-\(genName!)"
            }
        }
            return id.lowercased()
        }
    
    func birthYearString() -> String? {
        if self.birthYear != nil {
        return String(self.birthYear!)
        } else {
            return nil
            }
    }
    
    func deathYearString() -> String? {
        if self.deathYear != nil {
        return String(self.deathYear!)
        } else {
            return nil
            }
    }
    
    func getDisplayName() -> String {
        var middleName = ""
        if self.middleName != nil {
            middleName = " " + self.middleName!
        }
        var genName = ""
        if self.genName != nil {
            genName = " " + self.genName!
        }
        if self.altName != nil {
            return self.altName!
        } else {
            return self.firstName + middleName + " " + self.lastName + genName
        }
    }
    
    func getExportName() -> String {
        let birthYear: String = (self.birthYear != nil) ? String(self.birthYear!) : ""
        return self.lastName + " " + self.firstName + " (" + birthYear + ")"
    }
    
    func exportPersonElement() -> String {
        let currentDate = Date()
        let didDateFormatter = DateFormatter()
        didDateFormatter.locale = Locale(identifier: "en_US")
        didDateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = didDateFormatter.string(from: currentDate)
        var middleName = ""
        if self.middleName != nil {
            middleName = " " + self.middleName!
        }
        var genName = ""
        if self.genName != nil {
            genName = self.genName!
        }
        var altName = ""
        if self.altName != nil {
            altName = self.altName!
        }
        var birthYearString = ""
        if self.birthYear != nil {
            birthYearString = String(self.birthYear!)
        }
        var deathYearString = ""
        if self.deathYear != nil {
            deathYearString = String(self.deathYear!)
        }
        return """
        (: provenance: \(self.provenance ?? "no provenance provided") :)
        (: suggested new file name: \(self.id).xml :)
        <person>
        <id>\(self.id)</id>
        <persName>
        <surname>\(self.lastName)</surname>
        <forename>\(self.firstName)\(middleName)</forename>
        <genName>\(genName)</genName>
        <altname>\(altName)</altname>
        </persName>
        <birth>\(birthYearString)</birth>
        <death>\(deathYearString)</death>
        <career-type>\(self.career!.getCode())</career-type>
        <residence>
        <state-id>\(self.stateOfResidence!.rawValue)</state-id>
        </residence>
        <created-by>\(self.creationBy ?? "DIDit.app")</created-by>
        <created-date>\(self.creationDate ?? currentDateString)</created-date>
        <last-modified-by>\(self.modificationBy ?? "DIDit.app")</last-modified-by>
        <last-modified-date>\(currentDateString)</last-modified-date>
        </person>
"""
    }
    
    func exportPersonFullSCSV() -> String {
        // last name; first name; middle name; gen name; alt name; birth year; death year
        return "\(self.lastName), \(self.firstName), \(self.middleName ?? ""), \(self.genName ?? ""), \(self.altName ?? ""), \(self.birthYear != nil ? String(self.birthYear!) : ""), \(self.deathYear != nil ? String(self.deathYear!) : "")"
    }
    
    func exportPersonFullEscapedCSV() -> String {
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
        // last name; first name; middle name; gen name; alt name; birth year; death year
        return "\(escapeCommas(self.lastName)), \(escapeCommas(self.firstName)), \(escapeCommas(self.middleName)), \(escapeCommas(self.genName)), \(escapeCommas(self.altName)), \(self.birthYear != nil ? String(self.birthYear!) : ""), \(self.deathYear != nil ? String(self.deathYear!) : "")"
    }
    
    func exportPersonXMLForAirTable() -> String {
        print("\(self.id) exported")
        return """
        <person>
        <lastName>\(self.lastName)</lastName>
        <firstName>\(self.firstName)</firstName>
        <middleName>\(self.middleName ?? "")</middleName>
        <genName>\(self.genName ?? "")</genName>
        <altName>\(self.altName ?? "")</altName>
        <birthYear>\(self.birthYear != nil ? String(self.birthYear!) : "")</birthYear>
        <deathYear>\(self.deathYear != nil ? String(self.deathYear!) : "")</deathYear>
        </person>
        """
    }
    
    func exportPersonJson() -> String {
        let currentDate = Date()
                let didDateFormatter = DateFormatter()
                didDateFormatter.locale = Locale(identifier: "en_US")
                didDateFormatter.dateFormat = "yyyy-MM-dd"
                let currentDateString = didDateFormatter.string(from: currentDate)
                var middleName = ""
                if self.middleName != nil {
                    middleName = " " + self.middleName!
                }
                var genName = ""
                if self.genName != nil {
                    genName = "\"genName\": \"\(self.genName!)\","
                }
                var altName = ""
                if self.altName != nil {
                    altName = "\"altname\": \"\(self.altName!)\","
                }
                var birthYearString = ""
                if self.birthYear != nil {
                    birthYearString = "\"birth\": \(self.birthYear!)\","
                }
                var deathYearString = ""
                if self.deathYear != nil {
                    deathYearString = "\"death\": \(self.deathYear!)\","
                }
                return """
        {
            "id": "\(self.id)",
            "surname": "\(self.lastName)",
            "forename": "\(self.firstName)\(middleName)",
            \(altName)
            \(genName)
            \(birthYearString)
            \(deathYearString)
            "careerType": "\(self.career!.getCode())",
            "stateID": "\(self.stateOfResidence!.rawValue)",
            "createdBy": "\(self.creationBy ?? "DIDit.app")",
            "createdDate": "\(self.creationDate ?? currentDateString)",
            "lastModifiedBy": "\(self.modificationBy ?? "DIDit.app")",
            "lastModifiedDate": "\(currentDateString)"
        }
        """
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case middleName
        case genName
        case altName
        case birthYear
        case deathYear
        case career
        case stateOfResidence
        case creationDate
        case creationBy
        case modificationDate
        case modificationBy
        case createdWith
        case provenance
    }
    
   public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(firstName, forKey: .firstName)
    try container.encode(lastName, forKey: .lastName)
    try container.encode(middleName, forKey: .middleName)
    try container.encode(genName, forKey: .genName)
    try container.encode(altName, forKey: .altName)
    try container.encode(birthYear, forKey: .birthYear)
    try container.encode(deathYear, forKey: .deathYear)
    try container.encode(career?.rawValue, forKey: .career)
    try container.encode(stateOfResidence?.rawValue, forKey: .stateOfResidence)
    try container.encode(creationBy, forKey: .creationBy)
    try container.encode(creationDate, forKey: .creationDate)
    try container.encode(modificationBy, forKey: .modificationBy)
    try container.encode(modificationDate, forKey: .modificationDate)
    try container.encode(createdWith.rawValue, forKey: .createdWith)
    try container.encode(provenance, forKey: .provenance)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)!
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)!
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)!
        self.middleName = try container.decodeIfPresent(String.self, forKey: .middleName)
        self.genName = try container.decodeIfPresent(String.self, forKey: .genName)
        self.altName = try container.decodeIfPresent(String.self, forKey: .altName)
        self.birthYear = try container.decodeIfPresent(Int.self, forKey: .birthYear)
        self.deathYear = try container.decodeIfPresent(Int.self, forKey: .deathYear)
        let career = try container.decodeIfPresent(String.self, forKey: .career)
        if career != nil {
        self.career = Career(rawValue: career!)!
        }
        let state = try container.decodeIfPresent(String.self, forKey: .stateOfResidence)
        if state != nil {
            self.stateOfResidence = USState(rawValue: state!)!
        }
        self.creationBy = try container.decodeIfPresent(String.self, forKey: .creationBy)
        self.creationDate = try container.decodeIfPresent(String.self, forKey: .creationDate)
        self.modificationBy = try container.decodeIfPresent(String.self, forKey: .modificationBy)
        self.modificationDate = try container.decodeIfPresent(String.self, forKey: .modificationDate)
        let userAgent = try container.decodeIfPresent(String.self, forKey: .createdWith)
        self.createdWith = DataSource(rawValue: userAgent!)!
        self.provenance = try container.decodeIfPresent(String.self, forKey: .provenance)
    }
    deinit {
        print("POCOM Person \(self.id) deinitialized.")
    }
}
