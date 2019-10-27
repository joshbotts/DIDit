//
//  Data.swift
//  DID IT
//
//  Created by Joshua Botts on 10/4/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

class BundledStore {
    var peopleJson: [PocomPerson]
    var principalsJson: [PocomInstance]
    var chiefsJson: [PocomInstance]
    
    init() {
        func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
            let data: Data
            
            guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
                else {
                    fatalError("Couldn't find \(filename) in main bundle.")
            }
            
            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
            }
        }
        let jsonPersonData: [PocomPersonFromJson] = load("people.json")

       func transcodeJSONPeople() -> [PocomPerson] {
           var pocomPersonData: [PocomPerson] = []
           for jsonPerson in jsonPersonData {
               let newPerson = PocomPerson.init(from: jsonPerson)
               pocomPersonData.append(newPerson)
//               pocomPersonData.sort { $0.id < $1.id }
           }
           return pocomPersonData
       }
        let personDataInMemory: [PocomPerson] = transcodeJSONPeople()

        self.peopleJson = personDataInMemory
        
        let jsonPrincipalData: [PrincipalOfficerInstanceFromJson] = load("principals.json")

        func transcodeJSONPrincipals() -> [PocomInstance] {
            var pocomPrincipalData: [PocomInstance] = []
            for jsonPrincipal in jsonPrincipalData {
                let newPrincipal = PocomInstance.init(from: jsonPrincipal)
                pocomPrincipalData.append(newPrincipal)
            }
            return pocomPrincipalData
        }
        
        let principalDataInMemory: [PocomInstance] = transcodeJSONPrincipals()

        self.principalsJson = principalDataInMemory
        
        let jsonChiefsCountriesData: [ChiefOfMissionInstanceFromJson] = load("chiefs-countries.json")

        func transcodeJSONChiefsCountries() -> [PocomInstance] {
            var pocomChiefCountriesData: [PocomInstance] = []
            for jsonChief in jsonChiefsCountriesData {
                let newChief = PocomInstance.init(from: jsonChief)
                pocomChiefCountriesData.append(newChief)
            }
            return pocomChiefCountriesData
        }
        
        let chiefCountriesData: [PocomInstance] = transcodeJSONChiefsCountries()

        let jsonChiefsOrgsData: [ChiefOfMissionInstanceFromJson] = load("chiefs-orgs.json")

        func transcodeJSONChiefsOrgs() -> [PocomInstance] {
            var pocomChiefOrgsData: [PocomInstance] = []
            for jsonChief in jsonChiefsOrgsData {
                let newChief = PocomInstance.init(from: jsonChief)
                pocomChiefOrgsData.append(newChief)
            }
            return pocomChiefOrgsData
        }
        
        let chiefOrgsData: [PocomInstance] = transcodeJSONChiefsOrgs()
        
        let chiefDataInMemory = chiefOrgsData + chiefCountriesData
        
        self.chiefsJson = chiefDataInMemory
    }
    
    deinit {
    print("BundleStore deinitialized.")
    }
}

final class PocomStore : ObservableObject {
    @Published var people: [PocomPerson]
    @Published var principals: [PocomInstance]
    @Published var chiefs: [PocomInstance]
    
    func associatePerson(instance: PocomInstance) {
        if instance.person == nil {
        instance.person = self.personForInstance(instance: instance)
    }
    }
    
    func sortPeople() -> [PocomPerson] {
        var people = self.people
        people.sort { $0.id < $1.id }
        return people
    }
    
    func getPerson(instance: PocomInstance) -> PocomPerson {
        let dictionary = self.peopleDictionary(people: self.people)
        return dictionary[instance.personID]!
    }
    
    func peopleDictionary(people: [PocomPerson]) -> Dictionary<String, PocomPerson> {
        return Dictionary(grouping: self.people, by: { $0.id }).mapValues { $0.first! }
    }
    
    func personForInstance(instance: PocomInstance) -> PocomPerson {
        let personArray = self.people.filter { $0.id == instance.personID }
        return personArray[0]
    }
    
    func instancesForPerson(person: PocomPerson) -> Array<PocomInstance> {
        let instances: [PocomInstance] = self.principals.filter { $0.personID == person.id } + self.chiefs.filter { $0.personID == person.id }
        for instance in instances {
            if instance.person == nil {
            self.associatePerson(instance: instance)
        }
        }
        return instances
    }
    
    func instancesForCountry(country: XmlCountry) -> Array<PocomInstance> {
        let instances = self.chiefs.filter { $0.country == country }
        for instance in instances {
            if instance.person == nil {
                self.associatePerson(instance: instance)
            }
        }
        return instances
    }
    
    func instancesForRole(role: XmlPrincipalOfficerRole) -> Array<PocomInstance> {
        let instances = self.principals.filter { $0.poRole == role }
        for instance in instances {
            if instance.person == nil {
                self.associatePerson(instance: instance)
            }
        }
        return instances
    }
    
    
    init() {
        var localPeople: [PocomPerson] = []
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let peopleArchiveURL = documentsDirectory.appendingPathComponent("people").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let decodedPersonPlist = try? Data(contentsOf: peopleArchiveURL),
            let decodedPersonData = try? propertyListDecoder.decode(Array<PocomPerson>.self, from: decodedPersonPlist) {
            localPeople = decodedPersonData
        }
        let bundledPeople = BundledStore().peopleJson
        if bundledPeople.count < localPeople.count {
        self.people = localPeople
        } else {
            self.people = bundledPeople
        }
        var localPrincipals: [PocomInstance] = []
        let principalsArchiveURL = documentsDirectory.appendingPathComponent("principals").appendingPathExtension("plist")
        if let decodedPrincipalPlist = try? Data(contentsOf: principalsArchiveURL),
            let decodedPrincipalData = try? propertyListDecoder.decode(Array<PocomInstance>.self, from: decodedPrincipalPlist) {
            localPrincipals = decodedPrincipalData
        }
        let bundledPrincipals = BundledStore().principalsJson
        if bundledPrincipals.count < localPrincipals.count {
        self.principals = localPrincipals
        } else {
            self.principals = bundledPrincipals
        }
        var localChiefs: [PocomInstance] = []
        let chiefsArchiveURL = documentsDirectory.appendingPathComponent("chiefs").appendingPathExtension("plist")
        if let decodedChiefPlist = try? Data(contentsOf: chiefsArchiveURL), let decodedChiefData = try? propertyListDecoder.decode(Array<PocomInstance>.self, from: decodedChiefPlist) {
            localChiefs = decodedChiefData
        }
        let bundledChiefs = BundledStore().chiefsJson
        if bundledChiefs.count < localChiefs.count {
        self.chiefs = localChiefs
        } else {
            self.chiefs = bundledChiefs
        }
    }
    
    func appendPerson(_ person: PocomPerson) {
        self.people.append(person)
    }
    
    func countPeople() -> Int {
        return people.count
    }
    
    func appendPrincipal(_ instance: PocomInstance) {
            self.principals.append(instance)
        }
    
    func countPrincipals() -> Int {
        return principals.count
    }
    
    func appendChief(_ instance: PocomInstance) {
        self.chiefs.append(instance)
    }
    
    func countChiefs() -> Int {
        return chiefs.count
    }
    
    func saveStore() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let propertyListEncoder = PropertyListEncoder()
        let peopleArchiveURL = documentsDirectory.appendingPathComponent("people").appendingPathExtension("plist")
        let principalsArchiveURL = documentsDirectory.appendingPathComponent("principals").appendingPathExtension("plist")
        let chiefsArchiveURL = documentsDirectory.appendingPathComponent("chiefs").appendingPathExtension("plist")
        let encodedPersonData = try? propertyListEncoder.encode(self.people)
        try? encodedPersonData?.write(to: peopleArchiveURL, options: .noFileProtection)
        let encodedPrincipalData = try? propertyListEncoder.encode(self.principals)
        try? encodedPrincipalData?.write(to: principalsArchiveURL, options: .noFileProtection)
        let encodedChiefData = try? propertyListEncoder.encode(self.chiefs)
        try? encodedChiefData?.write(to: chiefsArchiveURL, options: .noFileProtection)
    }
    
    func resetStore() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let peopleArchiveURL = documentsDirectory.appendingPathComponent("people").appendingPathExtension("plist")
        let principalsArchiveURL = documentsDirectory.appendingPathComponent("principals").appendingPathExtension("plist")
        let chiefsArchiveURL = documentsDirectory.appendingPathComponent("chiefs").appendingPathExtension("plist")
        try? FileManager.default.removeItem(at: peopleArchiveURL)
        try? FileManager.default.removeItem(at: principalsArchiveURL)
        try? FileManager.default.removeItem(at: chiefsArchiveURL)
        self.people = BundledStore().peopleJson
        self.principals = BundledStore().principalsJson
        self.chiefs = BundledStore().chiefsJson
    }
    
    deinit {
    print("PocomStore deinitialized.")
    }
}
