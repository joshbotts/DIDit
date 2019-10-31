//
//  PersonViewDetail.swift
//  DID IT
//
//  Created by Joshua Botts on 10/3/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PersonViewDetail: View {
    
    @EnvironmentObject var pocom: PocomStore
    
    var person: PocomPerson
    var roles: [PocomInstance] {
        var roles = pocom.instancesForPerson(person: person)
        roles.sort { $0.sortDate() < $1.sortDate() }
        return roles
    }
    
    var personMiddleName: String {
        var middleName = ""
        if person.middleName  != nil {
            middleName = " " + person.middleName!
        }
        return middleName
    }
    var personGenName: String {
        var genName = ""
        if person.genName  != nil {
            genName = " " + person.genName!
        }
        return genName
    }
    var personName: String {
        if person.altName != nil {
            return person.altName!
        } else {
        return person.firstName + personMiddleName + " " + person.lastName + personGenName
    }
    }
    var personBirthYearString: String {
        var birthYear = ""
        if person.birthYear != nil {
            birthYear = String(person.birthYear!)
        } else {
            birthYear = "No birth year identified"
        }
        return birthYear
    }
    var personDeathYearString: String {
        var deathYear = ""
        if person.deathYear != nil {
            deathYear = String(person.deathYear!)
        } else {
            deathYear = "No year of death identified"
        }
        return deathYear
    }
        
    var body: some View {
        VStack(alignment: .leading) {
            Text(personName)
            .font(.headline)
            
            VStack(alignment: .leading) {
            Text(person.career?.rawValue ?? "No career type identified.")
            Text(person.stateOfResidence?.getStateName() ?? "No state of residence identified.")
            }
            .font(.body)
            
            HStack  {
                Text(personBirthYearString)
                Text("-")
                Text(personDeathYearString)
            }
            .font(.body)
            
            List(roles) { instanceRole in
                PocomInstanceForPersonDetailViewRow(instance: instanceRole)
            }
            
    }
    .padding()
        .navigationBarTitle("\(person.firstName) \(person.lastName)")
        .navigationBarItems(leading:
            NavigationLink(destination: PersonViewList()) {
            Text("People")
        }
        )
        .navigationBarItems(trailing:
            NavigationLink(destination: PersonEditView(person: person)) {
            Text("Edit")
        }
        )
    }
}

//struct PersonViewDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonViewDetail(person: person)
//    }
//}
