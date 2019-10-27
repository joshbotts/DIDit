//
//  XmlPrincipalOfficerRole.swift
//  DID IT
//
//  Created by Joshua Botts on 9/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum XmlPrincipalOfficerRole: String, Identifiable, Hashable, CaseIterable {
    var id: String {
        return self.rawValue
    }
    
    case agencyAID = "administrator-aid"
    case agencyECA = "administrator-economic-cooperation-administration"
    case agencyTCA = "administrator-technical-cooperation-administration"
    case roleAmbAL = "ambassador-at-large"
    case roleAS = "assistant-secretary"
    case roleBureauAVC = "assistant-secretary-arms-control-verification-compliance"
    case roleBureauCA = "assistant-secretary-consular-affairs"
    case roleEURFENEAF = "assistant-secretary-european-far-near-eastern-african"
    case roleBureauA = "assistant-secretary-for-administration"
    case roleBureauAF = "assistant-secretary-for-african-affairs"
    case roleBureauAC = "assistant-secretary-for-arms-control"
    case roleBureauCSO = "assistant-secretary-for-conflict-and-stabilization-operations"
    case roleBureauDRL = "assistant-secretary-for-democracy-human-rights-labor-affairs"
    case roleBureauDS = "assistant-secretary-for-diplomatic-security"
    case roleBureauEAP = "assistant-secretary-for-east-asian-pacific-affairs"
    case roleBureauEB = "assistant-secretary-for-economic-business-affairs"
    case roleBureauECA = "assistant-secretary-for-educational-cultural-affairs"
    case roleBureauENR = "assistant-secretary-for-energy-resources"
    case roleBureauEUR = "assistant-secretary-for-european-affairs"
    case roleBureauISN = "assistant-secretary-for-international-security-and-nonproliferation"
    case roleBureauINL = "assistant-secretary-for-narcotics-and-law"
    case roleBureauNEA = "assistant-secretary-for-near-eastern-affairs"
    case roleBureauOES = "assistant-secretary-for-oceans-environmental-scientific"
    case roleASP = "assistant-secretary-for-political-affairs"
    case roleBureauPM = "assistant-secretary-for-politico-military-affairs"
    case roleBureauPRM = "assistant-secretary-for-population-refugees-migration"
    case roleBureauPA = "assistant-secretary-for-public-affairs"
    case roleBureauRM = "assistant-secretary-for-resource-management"
    case roleBureauSCA = "assistant-secretary-for-south-asian-affairs"
    case roleBureauWHA = "assistant-secretary-for-western-hemisphere"
    case roleBureauINR = "assistant-secretary-intelligence-research"
    case roleBureauIO = "assistant-secretary-international-organization-affairs"
    case roleBureauH = "assistant-secretary-legislative-affairs"
    case roleBureauNP = "assistant-secretary-non-proliferation"
    case roleASOA = "assistant-secretary-occupied-areas"
    case roleASTC = "assistant-secretary-transportation-communication"
    case roleAS2 = "assistant-secretary2"
    case careerAmbassador = "career-ambassador"
    case roleCC = "chief-clerk"
    case roleCPR = "chief-of-protocol"
    case roleCGFS = "comptroller-director-global-financial-services"
    case roleCT = "coordinator-combatting-terrorism"
    case roleCICIP = "coordinator-intl-communications-information-policy"
    case roleC = "counselor"
    case roleDIGFA = "deputy-inspector-general-foreign-assistance"
    case roleD = "deputy-secretary"
    case roleDMR = "deputy-secretary-for-mgmt-and-resources"
    case roleDUS = "deputy-under-secretary"
    case roleDUE = "deputy-under-secretary-for-economic-affairs"
    case roleDUM = "deputy-under-secretary-for-mgmt"
    case roleDUP = "deputy-under-secretary-for-political-affairs"
    case roleBureauBP = "director-bureau-budget-planning"
    case roleBureauFMP = "director-bureau-financial-mgmt-policy"
    case roleGA = "director-bureau-german-affairs"
    case roleFOA = "director-foreign-operations-administration"
    case roleBureauFSI = "director-foreign-service-institute"
    case roleDGHR = "director-general-foreign-service"
    case agencyICA = "director-intl-cooperation-administration"
    case roleMPRI = "director-management-policy-rightsizing-innovation"
    case agencyMSA = "director-mutual-security-agency"
    case roleOFM = "director-office-foreign-missions"
    case roleMED = "director-office-medical-services"
    case roleMP = "director-office-mgmt-policy"
    case roleSP = "director-policy-planning"
    case agencyACDA = "director-us-arms-control-disarmament-agency"
    case agencyUSIA = "director-usia"
    case roleES = "executive-secretary"
    case roleIG = "inspector-general"
    case roleIGFA = "inspector-general-foreign-assistance"
    case roleL = "legal-adviser"
    case role2AS = "second-assistant-secretary"
    case roleS = "secretary"
    case roleSAI = "secretary-ad-interim"
    case roleSFACC = "secretary-of-foreign-affairs-continental-congress"
    case role3AS = "third-assistant-secretary"
    case roleUS = "under-secretary"
    case roleT = "under-secretary-for-arms-control"
    case roleE = "under-secretary-for-econ-business-ag"
    case roleJ = "under-secretary-for-global-affairs"
    case roleM = "under-secretary-for-mgmt"
    case roleP = "under-secretary-for-political-affairs"
    case roleR = "under-secretary-for-public-diplomacy"
    case agencyUSTR = "us-trade-representative"
    case none = "none"

    func getPORoleCode() -> String {
        let xmlPrincipalOfficerRole = [
        "administrator-aid": ["aid", "administrator-aid", "Administrator of the Agency for International Development"],
        "administrator-economic-cooperation-administration": ["admi", "administrator-economic-cooperation-administration", "Administrator of the Economic Cooperation Administration"],
        "administrator-technical-cooperation-administration": ["admi", "administrator-technical-cooperation-administration", "Administrator of the Technical Cooperation Administration"],
        "ambassador-at-large": ["larg", "ambassador-at-large", "Ambassador at Large"],
        "assistant-secretary": ["secr", "assistant-secretary", "Assistant Secretary of State"],
        "assistant-secretary-arms-control-verification-compliance": ["comp", "assistant-secretary-arms-control-verification-compliance", "Assistant Seecretary of State for Arms Control, Verification, and Compliance"],
        "assistant-secretary-consular-affairs": ["affa", "assistant-secretary-consular-affairs", "Assistant Secretary of State for Consular Affairs"],
        "assistant-secretary-european-far-near-eastern-african": ["afri", "assistant-secretary-european-far-near-eastern-african", "Assistant Secretary of State for European, Far Eastern, Near Eastern, and African Affairs"],
        "assistant-secretary-for-administration": ["admi", "assistant-secretary-for-administration", "Assistant Secretary of State for Administration"],
        "assistant-secretary-for-african-affairs": ["affa", "assistant-secretary-for-african-affairs", "Assistant Secretary of State for African Affairs"],
        "assistant-secretary-for-arms-control": ["cont", "assistant-secretary-for-arms-control", "Assistant Secretary of State for Arms Control"],
        "assistant-secretary-for-conflict-and-stabilization-operations": ["oper", "assistant-secretary-for-conflict-and-stabilization-operations", "Assistant Secretary of State for Conflict and Stabilization Operations"],
            "assistant-secretary-for-democracy-human-rights-labor-affairs": ["affa", "assistant-secretary-for-democracy-human-rights-labor-affairs", "Assistant Secretary of State for Democracy, Human Rights, and Labor"],
            "assistant-secretary-for-diplomatic-security": ["secu", "assistant-secretary-for-diplomatic-security", "Assistant Secretary of State for Diplomatic Security"],
            "assistant-secretary-for-east-asian-pacific-affairs": ["affa", "assistant-secretary-for-east-asian-pacific-affairs", "Assistant Secretary of State for East Asian and Pacific Affairs"],
            "assistant-secretary-for-economic-business-affairs": ["affa", "assistant-secretary-for-economic-business-affairs", "Assistant Secretary of State for Economic, Energy, and Business Affairs"],
            "assistant-secretary-for-educational-cultural-affairs": ["affa", "assistant-secretary-for-educational-cultural-affairs", "Assistant Secretary of State for Educational and Cultural Affairs"],
            "assistant-secretary-for-energy-resources": ["reso", "assistant-secretary-for-energy-resources", "Assistant Secretary of State for Energy Resources"],
            "assistant-secretary-for-european-affairs": ["affa", "assistant-secretary-for-european-affairs", "Assistant Secretary of State for European and Eurasian Affairs"],
            "assistant-secretary-for-international-security-and-nonproliferation": ["nonp", "assistant-secretary-for-international-security-and-nonproliferation", "Assistant Secretary of State for International Security and Nonproliferation"],
            "assistant-secretary-for-narcotics-and-law": ["law", "assistant-secretary-for-narcotics-and-law", "Assistant Secretary of State for International Narcotics and Law Enforcement Affairs"],
            "assistant-secretary-for-near-eastern-affairs": ["affa", "assistant-secretary-for-near-eastern-affairs", "Assistant Secretary of State for Near Eastern Affairs"],
            "assistant-secretary-for-oceans-environmental-scientific": ["scie", "assistant-secretary-for-oceans-environmental-scientific", "Assistant Secretary of State for Oceans and International Environmental and Scientific Affairs"],
            "assistant-secretary-for-political-affairs": ["affa", "assistant-secretary-for-political-affairs", "Assistant Secretary of State for Political Affairs"],
            "assistant-secretary-for-politico-military-affairs": ["affa", "assistant-secretary-for-politico-military-affairs", "Assistant Secretary of State for Politico-Military Affairs"],
            "assistant-secretary-for-population-refugees-migration": ["migr", "assistant-secretary-for-population-refugees-migration", "Assistant Secretary of State for Population, Refugees, and Migration Affairs"],
            "assistant-secretary-for-public-affairs": ["affa", "assistant-secretary-for-public-affairs", "Assistant Secretary of State for Public Affairs"],
            "assistant-secretary-for-resource-management": ["mana", "assistant-secretary-for-resource-management", "Assistant Secretary of State for Resource Management"],
            "assistant-secretary-for-south-asian-affairs": ["affa", "assistant-secretary-for-south-asian-affairs", "Assistant Secretary of State for South and Central Asian Affairs"],
            "assistant-secretary-for-western-hemisphere": ["hemi", "assistant-secretary-for-western-hemisphere", "Assistant Secretary of State for Western Hemisphere Affairs"],
            "assistant-secretary-intelligence-research": ["rese", "assistant-secretary-intelligence-research", "Assistant Secretary of State for Intelligence and Research"],
            "assistant-secretary-international-organization-affairs": ["affa", "assistant-secretary-international-organization-affairs", "Assistant Secretary of State for International Organization Affairs"],
            "assistant-secretary-legislative-affairs": ["affa", "assistant-secretary-legislative-affairs", "Assistant Secretary of State for Legislative Affairs"],
            "assistant-secretary-non-proliferation": ["prol", "assistant-secretary-non-proliferation", "Assistant Secretary of State for Non-Proliferation"],
            "assistant-secretary-occupied-areas": ["area", "assistant-secretary-occupied-areas", "Assistant Secretary of State for Occupied Areas"],
            "assistant-secretary-transportation-communication": ["comm", "assistant-secretary-transportation-communication", "Assistant Secretary of State for Transportation and Communication"],
            "assistant-secretary2": ["secr", "assistant-secretary2", "Assistant Secretary of State"],
            "career-ambassador": ["amba", "career-ambassador", "Career Ambassador"],
            "chief-clerk": ["cler", "chief-clerk", "Chief Clerk"],
            "chief-of-protocol": ["prot", "chief-of-protocol", "Chief of Protocol"],
            "comptroller-director-global-financial-services": ["serv", "comptroller-director-global-financial-services", "Comptroller and Director of the Bureau of Global Financial Services"],
            "coordinator-combatting-terrorism": ["terr", "coordinator-combatting-terrorism", "Director of the Bureau of Counterterrorism"],
            "coordinator-intl-communications-information-policy": ["poli", "coordinator-intl-communications-information-policy", "Coordinator for International Communications and Information Policy"],
            "counselor": ["coun", "counselor", "Counselor"],
            "deputy-inspector-general-foreign-assistance": ["assi", "deputy-inspector-general-foreign-assistance", "Deputy Inspector General of Foreign Assistance"],
            "deputy-secretary": ["secr", "deputy-secretary", "Deputy Secretary of State"],
            "deputy-secretary-for-mgmt-and-resources": ["reso", "deputy-secretary-for-mgmt-and-resources", "Deputy Secretary of State for Management and Resources"],
            "deputy-under-secretary": ["secr", "deputy-under-secretary", "Deputy Under Secretary of State"],
            "deputy-under-secretary-for-economic-affairs": ["affa", "deputy-under-secretary-for-economic-affairs", "Deputy Under Secretary of State for Economic Affairs"],
            "deputy-under-secretary-for-mgmt": ["mgmt", "deputy-under-secretary-for-mgmt", "Deputy Under Secretary of State for Management"],
            "deputy-under-secretary-for-political-affairs": ["affa", "deputy-under-secretary-for-political-affairs", "Deputy Under Secretary of State for Political Affairs"],
            "director-bureau-budget-planning": ["plan", "director-bureau-budget-planning", "Director of the Bureau of Budget and Planning"],
            "director-bureau-financial-mgmt-policy": ["plan?", "director-bureau-financial-mgmt-policy", "Director of the Bureau of Financial Management and Policy"],
            "director-bureau-german-affairs": ["affa", "director-bureau-german-affairs", "Director of the Bureau of German Affairs"],
            "director-foreign-operations-administration": ["admi", "director-foreign-operations-administration", "Director of the Foreign Operations Administration"],
            "director-foreign-service-institute": ["inst", "director-foreign-service-institute", "Director of the Foreign Service Institute"],
            "director-general-foreign-service": ["serv", "director-general-foreign-service", "Director General of the Foreign Service"],
            "director-intl-cooperation-administration": ["admi", "director-intl-cooperation-administration", "Director of the International Cooperation Administration"],
            "director-management-policy-rightsizing-innovation": ["inno", "director-management-policy-rightsizing-innovation", "Director of the Office of Management Policy, Rightsizing, and Innovation"],
            "director-mutual-security-agency": ["agen", "director-mutual-security-agency", "Director of the Mutual Security Agency"],
            "director-office-foreign-missions": ["miss", "director-office-foreign-missions", "Director of the Office of Foreign Missions"],
            "director-office-medical-services": ["serv", "director-office-medical-services", "Director of the Office of Medical Services"],
            "director-office-mgmt-policy": ["poli", "director-office-mgmt-policy", "Director of the Office of Management Policy"],
            "director-policy-planning": ["plan", "director-policy-planning", "Director of Policy Planning"],
            "director-us-arms-control-disarmament-agency": ["agen", "director-us-arms-control-disarmament-agency", "Director of the U.S. Arms Control and Disarmament Agency"],
            "director-usia": ["usia", "director-usia", "Director of the U.S. Information Agency"],
            "executive-secretary": ["secr", "executive-secretary", "Executive Secretary"],
            "inspector-general": ["gene", "inspector-general", "Inspector General of the Department of State and the Foreign Service"],
            "inspector-general-foreign-assistance": ["assi", "inspector-general-foreign-assistance", "Inspector General of Foreign Assistance"],
            "legal-adviser": ["advi", "legal-adviser", "Legal Adviser"],
            "second-assistant-secretary": ["secr", "second-assistant-secretary", "Second Assistant Secretary of State"],
            "secretary": ["secr", "secretary", "Secretary of State"],
            "secretary-ad-interim": ["inte", "secretary-ad-interim", "Secretary of State ad interim"],
            "secretary-of-foreign-affairs-continental-congress": ["cong", "secretary-of-foreign-affairs-continental-congress", "Secretary of Foreign Affairs Under the Continental Congress"],
            "third-assistant-secretary": ["secr", "third-assistant-secretary", "Third Assistant Secretary of State"],
            "under-secretary": ["secr", "under-secretary", "Under Secretary of State"],
            "under-secretary-for-arms-control": ["cont", "under-secretary-for-arms-control", "Under Secretary of State for Arms Control and International Security Affairs"],
            "under-secretary-for-econ-business-ag": ["ag", "under-secretary-for-econ-business-ag", "Under Secretary for Economic Growth, Energy, and the Environment"],
            "under-secretary-for-global-affairs": ["affa", "under-secretary-for-global-affairs", "Under Secretary of State for Civilian Security, Democracy, and Human Rights"],
            "under-secretary-for-mgmt": ["mgmt", "under-secretary-for-mgmt", "Under Secretary of State for Management"],
            "under-secretary-for-political-affairs": ["affa", "under-secretary-for-political-affairs", "Under Secretary of State for Political Affairs"],
            "under-secretary-for-public-diplomacy": ["dipl", "under-secretary-for-public-diplomacy", "Under Secretary of State for Public Diplomacy and Public Affairs"],
            "us-trade-representative": ["repr", "us-trade-representative", "U.S. Trade Representative"],
            "none": ["none", "none", "none"]
        ]
        return xmlPrincipalOfficerRole[self.rawValue]![0]
    }
    
    func getPORoleName() -> String {
        let xmlPrincipalOfficerRole = [
        "administrator-aid": ["aid", "administrator-aid", "Administrator of the Agency for International Development"],
        "administrator-economic-cooperation-administration": ["admi", "administrator-economic-cooperation-administration", "Administrator of the Economic Cooperation Administration"],
        "administrator-technical-cooperation-administration": ["admi", "administrator-technical-cooperation-administration", "Administrator of the Technical Cooperation Administration"],
        "ambassador-at-large": ["larg", "ambassador-at-large", "Ambassador at Large"],
        "assistant-secretary": ["secr", "assistant-secretary", "Assistant Secretary of State"],
        "assistant-secretary-arms-control-verification-compliance": ["comp", "assistant-secretary-arms-control-verification-compliance", "Assistant Seecretary of State for Arms Control, Verification, and Compliance"],
        "assistant-secretary-consular-affairs": ["affa", "assistant-secretary-consular-affairs", "Assistant Secretary of State for Consular Affairs"],
        "assistant-secretary-european-far-near-eastern-african": ["afri", "assistant-secretary-european-far-near-eastern-african", "Assistant Secretary of State for European, Far Eastern, Near Eastern, and African Affairs"],
        "assistant-secretary-for-administration": ["admi", "assistant-secretary-for-administration", "Assistant Secretary of State for Administration"],
        "assistant-secretary-for-african-affairs": ["affa", "assistant-secretary-for-african-affairs", "Assistant Secretary of State for African Affairs"],
        "assistant-secretary-for-arms-control": ["cont", "assistant-secretary-for-arms-control", "Assistant Secretary of State for Arms Control"],
        "assistant-secretary-for-conflict-and-stabilization-operations": ["oper", "assistant-secretary-for-conflict-and-stabilization-operations", "Assistant Secretary of State for Conflict and Stabilization Operations"],
            "assistant-secretary-for-democracy-human-rights-labor-affairs": ["affa", "assistant-secretary-for-democracy-human-rights-labor-affairs", "Assistant Secretary of State for Democracy, Human Rights, and Labor"],
            "assistant-secretary-for-diplomatic-security": ["secu", "assistant-secretary-for-diplomatic-security", "Assistant Secretary of State for Diplomatic Security"],
            "assistant-secretary-for-east-asian-pacific-affairs": ["affa", "assistant-secretary-for-east-asian-pacific-affairs", "Assistant Secretary of State for East Asian and Pacific Affairs"],
            "assistant-secretary-for-economic-business-affairs": ["affa", "assistant-secretary-for-economic-business-affairs", "Assistant Secretary of State for Economic, Energy, and Business Affairs"],
            "assistant-secretary-for-educational-cultural-affairs": ["affa", "assistant-secretary-for-educational-cultural-affairs", "Assistant Secretary of State for Educational and Cultural Affairs"],
            "assistant-secretary-for-energy-resources": ["reso", "assistant-secretary-for-energy-resources", "Assistant Secretary of State for Energy Resources"],
            "assistant-secretary-for-european-affairs": ["affa", "assistant-secretary-for-european-affairs", "Assistant Secretary of State for European and Eurasian Affairs"],
            "assistant-secretary-for-international-security-and-nonproliferation": ["nonp", "assistant-secretary-for-international-security-and-nonproliferation", "Assistant Secretary of State for International Security and Nonproliferation"],
            "assistant-secretary-for-narcotics-and-law": ["law", "assistant-secretary-for-narcotics-and-law", "Assistant Secretary of State for International Narcotics and Law Enforcement Affairs"],
            "assistant-secretary-for-near-eastern-affairs": ["affa", "assistant-secretary-for-near-eastern-affairs", "Assistant Secretary of State for Near Eastern Affairs"],
            "assistant-secretary-for-oceans-environmental-scientific": ["scie", "assistant-secretary-for-oceans-environmental-scientific", "Assistant Secretary of State for Oceans and International Environmental and Scientific Affairs"],
            "assistant-secretary-for-political-affairs": ["affa", "assistant-secretary-for-political-affairs", "Assistant Secretary of State for Political Affairs"],
            "assistant-secretary-for-politico-military-affairs": ["affa", "assistant-secretary-for-politico-military-affairs", "Assistant Secretary of State for Politico-Military Affairs"],
            "assistant-secretary-for-population-refugees-migration": ["migr", "assistant-secretary-for-population-refugees-migration", "Assistant Secretary of State for Population, Refugees, and Migration Affairs"],
            "assistant-secretary-for-public-affairs": ["affa", "assistant-secretary-for-public-affairs", "Assistant Secretary of State for Public Affairs"],
            "assistant-secretary-for-resource-management": ["mana", "assistant-secretary-for-resource-management", "Assistant Secretary of State for Resource Management"],
            "assistant-secretary-for-south-asian-affairs": ["affa", "assistant-secretary-for-south-asian-affairs", "Assistant Secretary of State for South and Central Asian Affairs"],
            "assistant-secretary-for-western-hemisphere": ["hemi", "assistant-secretary-for-western-hemisphere", "Assistant Secretary of State for Western Hemisphere Affairs"],
            "assistant-secretary-intelligence-research": ["rese", "assistant-secretary-intelligence-research", "Assistant Secretary of State for Intelligence and Research"],
            "assistant-secretary-international-organization-affairs": ["affa", "assistant-secretary-international-organization-affairs", "Assistant Secretary of State for International Organization Affairs"],
            "assistant-secretary-legislative-affairs": ["affa", "assistant-secretary-legislative-affairs", "Assistant Secretary of State for Legislative Affairs"],
            "assistant-secretary-non-proliferation": ["prol", "assistant-secretary-non-proliferation", "Assistant Secretary of State for Non-Proliferation"],
            "assistant-secretary-occupied-areas": ["area", "assistant-secretary-occupied-areas", "Assistant Secretary of State for Occupied Areas"],
            "assistant-secretary-transportation-communication": ["comm", "assistant-secretary-transportation-communication", "Assistant Secretary of State for Transportation and Communication"],
            "assistant-secretary2": ["secr", "assistant-secretary2", "Assistant Secretary of State"],
            "career-ambassador": ["amba", "career-ambassador", "Career Ambassador"],
            "chief-clerk": ["cler", "chief-clerk", "Chief Clerk"],
            "chief-of-protocol": ["prot", "chief-of-protocol", "Chief of Protocol"],
            "comptroller-director-global-financial-services": ["serv", "comptroller-director-global-financial-services", "Comptroller and Director of the Bureau of Global Financial Services"],
            "coordinator-combatting-terrorism": ["terr", "coordinator-combatting-terrorism", "Director of the Bureau of Counterterrorism"],
            "coordinator-intl-communications-information-policy": ["poli", "coordinator-intl-communications-information-policy", "Coordinator for International Communications and Information Policy"],
            "counselor": ["coun", "counselor", "Counselor"],
            "deputy-inspector-general-foreign-assistance": ["assi", "deputy-inspector-general-foreign-assistance", "Deputy Inspector General of Foreign Assistance"],
            "deputy-secretary": ["secr", "deputy-secretary", "Deputy Secretary of State"],
            "deputy-secretary-for-mgmt-and-resources": ["reso", "deputy-secretary-for-mgmt-and-resources", "Deputy Secretary of State for Management and Resources"],
            "deputy-under-secretary": ["secr", "deputy-under-secretary", "Deputy Under Secretary of State"],
            "deputy-under-secretary-for-economic-affairs": ["affa", "deputy-under-secretary-for-economic-affairs", "Deputy Under Secretary of State for Economic Affairs"],
            "deputy-under-secretary-for-mgmt": ["mgmt", "deputy-under-secretary-for-mgmt", "Deputy Under Secretary of State for Management"],
            "deputy-under-secretary-for-political-affairs": ["affa", "deputy-under-secretary-for-political-affairs", "Deputy Under Secretary of State for Political Affairs"],
            "director-bureau-budget-planning": ["plan", "director-bureau-budget-planning", "Director of the Bureau of Budget and Planning"],
            "director-bureau-financial-mgmt-policy": ["plan?", "director-bureau-financial-mgmt-policy", "Director of the Bureau of Financial Management and Policy"],
            "director-bureau-german-affairs": ["affa", "director-bureau-german-affairs", "Director of the Bureau of German Affairs"],
            "director-foreign-operations-administration": ["admi", "director-foreign-operations-administration", "Director of the Foreign Operations Administration"],
            "director-foreign-service-institute": ["inst", "director-foreign-service-institute", "Director of the Foreign Service Institute"],
            "director-general-foreign-service": ["serv", "director-general-foreign-service", "Director General of the Foreign Service"],
            "director-intl-cooperation-administration": ["admi", "director-intl-cooperation-administration", "Director of the International Cooperation Administration"],
            "director-management-policy-rightsizing-innovation": ["inno", "director-management-policy-rightsizing-innovation", "Director of the Office of Management Policy, Rightsizing, and Innovation"],
            "director-mutual-security-agency": ["agen", "director-mutual-security-agency", "Director of the Mutual Security Agency"],
            "director-office-foreign-missions": ["miss", "director-office-foreign-missions", "Director of the Office of Foreign Missions"],
            "director-office-medical-services": ["serv", "director-office-medical-services", "Director of the Office of Medical Services"],
            "director-office-mgmt-policy": ["poli", "director-office-mgmt-policy", "Director of the Office of Management Policy"],
            "director-policy-planning": ["plan", "director-policy-planning", "Director of Policy Planning"],
            "director-us-arms-control-disarmament-agency": ["agen", "director-us-arms-control-disarmament-agency", "Director of the U.S. Arms Control and Disarmament Agency"],
            "director-usia": ["usia", "director-usia", "Director of the U.S. Information Agency"],
            "executive-secretary": ["secr", "executive-secretary", "Executive Secretary"],
            "inspector-general": ["gene", "inspector-general", "Inspector General of the Department of State and the Foreign Service"],
            "inspector-general-foreign-assistance": ["assi", "inspector-general-foreign-assistance", "Inspector General of Foreign Assistance"],
            "legal-adviser": ["advi", "legal-adviser", "Legal Adviser"],
            "second-assistant-secretary": ["secr", "second-assistant-secretary", "Second Assistant Secretary of State"],
            "secretary": ["secr", "secretary", "Secretary of State"],
            "secretary-ad-interim": ["inte", "secretary-ad-interim", "Secretary of State ad interim"],
            "secretary-of-foreign-affairs-continental-congress": ["cong", "secretary-of-foreign-affairs-continental-congress", "Secretary of Foreign Affairs Under the Continental Congress"],
            "third-assistant-secretary": ["secr", "third-assistant-secretary", "Third Assistant Secretary of State"],
            "under-secretary": ["secr", "under-secretary", "Under Secretary of State"],
            "under-secretary-for-arms-control": ["cont", "under-secretary-for-arms-control", "Under Secretary of State for Arms Control and International Security Affairs"],
            "under-secretary-for-econ-business-ag": ["ag", "under-secretary-for-econ-business-ag", "Under Secretary for Economic Growth, Energy, and the Environment"],
            "under-secretary-for-global-affairs": ["affa", "under-secretary-for-global-affairs", "Under Secretary of State for Civilian Security, Democracy, and Human Rights"],
            "under-secretary-for-mgmt": ["mgmt", "under-secretary-for-mgmt", "Under Secretary of State for Management"],
            "under-secretary-for-political-affairs": ["affa", "under-secretary-for-political-affairs", "Under Secretary of State for Political Affairs"],
            "under-secretary-for-public-diplomacy": ["dipl", "under-secretary-for-public-diplomacy", "Under Secretary of State for Public Diplomacy and Public Affairs"],
            "us-trade-representative": ["repr", "us-trade-representative", "U.S. Trade Representative"],
            "none": ["none", "none", "none"]
        ]
        return xmlPrincipalOfficerRole[self.rawValue]![2]
    }
}
