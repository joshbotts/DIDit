//
//  XmlIntermediateTypes.swift
//  DID IT POCOM
//
//  Created by Joshua Botts on 10/1/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

struct PocomPersonFromJson: Decodable, Identifiable  {
    var id: String
    var surname: String
    var forename: String
    var genName: String?
    var altname: String?
    var birth: Int?
    var death: Int?
    var careerType: String?
    var stateID: String?
    var createdBy: String
    var createdDate: String
    var lastModifiedBy: String
    var lastModifiedDate: String
}


struct ChiefOfMissionInstanceFromJson: Decodable, Identifiable {
    var id: String
    var personID: String
    var roleTitleID: String
    var contemporaryTerritoryID: String
    var appointedDate: String?
    var appointedNote: String?
    var arrivedDate: String?
    var arrivedNote: String?
    var startedDate: String?
    var startedNote: String?
    var endedDate: String?
    var endedNote: String?
    var note: String?
    var createdBy: String
    var createdDate: String
    var lastModifiedBy: String
    var lastModifiedDate: String
}

struct PrincipalOfficerInstanceFromJson: Decodable, Identifiable {
    var id: String
    var personID: String
    var roleTitleID: String
    var appointedDate: String?
    var appointedNote:  String?
    var startedDate: String?
    var startedNote: String?
    var endedDate: String?
    var endedNote: String?
    var note: String?
    var createdBy: String
    var createdDate: String
    var lastModifiedBy: String
    var lastModifiedDate: String
}
