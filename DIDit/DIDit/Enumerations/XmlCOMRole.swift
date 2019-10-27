//
//  ChiefOfMissionRole.swift
//  DID IT
//
//  Created by Joshua Botts on 9/17/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum XmlCOMRole: String, Identifiable, Hashable, CaseIterable {
    var id: String {
        return self.rawValue
    }
    
    case actingPrincipalOfficer = "acting-principal-officer"
    case agentConsulGeneral = "agent-consul-general"
    case agent = "agent"
    case ambassadorEP = "ambassador-e-p"
    case chargeDaffairesAdInterim = "charge-daffaires-ad-interim"
    case chargeDaffairesConsulGeneral = "charge-daffaires-consul-general"
    case chargeDaffairesProTem = "charge-daffaires-pro-tem"
    case chargeDaffaires = "charge-daffaires"
    case chiefOfMissionOfUSOfficeAbroad = "chief-of-mission-of-us-office-abroad"
    case chief = "chief"
    case commissionerConsulGeneral = "commissioner-consul-general"
    case commissioner = "commissioner"
    case consulGeneral = "consul-general"
    case deputyAmbassador = "deputy-ambassador"
    case diplomaticAgentConsulGeneral = "diplomatic-agent-consul-general"
    case diplomaticAgent = "diplomatic-agent"
    case director = "director"
    case envoyExtraordinaryMinisterPlenipotentiaryConsulGeneral = "envoy-extraordinary-minister-plenipotentiary-consul-general"
    case envoyExtraordinaryMinisterPlenipotentiary = "envoy-extraordinary-minister-plenipotentiary"
    case ministerPlenipotentiary = "minister-plenipotentiary"
    case ministerResidentAndExtraordinary = "minister-resident-and-extraordinary"
    case ministerResidentConsulGeneral = "minister-resident-consul-general"
    case ministerResidentForeignServiceOfficer = "minister-resident-foreign-service-officer"
    case ministerResident = "minister-resident"
    case minister = "minister"
    case personalRepresentativeOfThePresident = "personal-representative-of-the-president"
    case principalOfficer = "principal-officer"
    case representative = "representative"
    case none = "none"
    
    func getTitle() -> String {
        let xmlCOMRole = [
            "acting-principal-officer": "Acting Principal Officer",
            "agent-consul-general": "Agent Consul General",
            "agent": "Agent",
            "ambassador-e-p": "Ambassador Extraordinary and Plenipotentiary",
            "charge-daffaires-ad-interim": "Chargé d'affaires ad interim",
            "charge-daffaires-consul-general": "Chargé d'affaires Consul General",
            "charge-daffaires-pro-tem": "Chargé d'affaires pro tem",
            "charge-daffaires": "Chargé d'affaires",
            "chief-of-mission-of-us-office-abroad": "Chief of Mission of US Office Abroad",
            "chief": "Chief",
            "commissioner-consul-general": "Commissioner Consul General",
            "commissioner": "Commissioner",
            "consul-general": "Consul General",
            "deputy-ambassador": "Deputy Ambassador",
            "diplomatic-agent-consul-general":"Diplomatic Agent Consul General",
            "diplomatic-agent": "Diplomatic Agent",
            "director": "Director",
            "envoy-extraordinary-minister-plenipotentiary-consul-general": "Envoy Extraordinary Minister Plenipotentiary Consul General",
            "envoy-extraordinary-minister-plenipotentiary": "Envoy Extraordinary Minister Plenipotentiary",
            "minister-plenipotentiary": "Minister Plenipotentiary",
            "minister-resident-and-extraordinary": "Minister Resident and Extraordinary",
            "minister-resident-consul-general": "Minister Resident Consul General",
            "minister-resident-foreign-service-officer": "Minister Resident Foreign Service Officer",
            "minister-resident": "Minister Resident",
            "minister": "Minister",
            "personal-representative-of-the-president": "Personal Representative of the President",
            "principal-officer": "Principal Officer",
            "representative": "Representative",
            "none": "none"
        ]
        return xmlCOMRole[self.rawValue]!
    }
}
