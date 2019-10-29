//
//  InstanceAddView.swift
//  POCOM
//
//  Created by Joshua Botts on 10/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct InstanceAddView: View {
    @EnvironmentObject var pocom: PocomStore
    var person: PocomPerson
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
        return String(person.firstName + personMiddleName + " " + person.lastName + personGenName)
    }
    
    var body: some View {
        VStack
            {
                Text("Adding a new role for \(personName)")
                Text("Select the type of role to add:")
                NavigationLink(destination: PrincipalAddView(person: self.person)) {
                    Text("Principal Officer")
                }
                NavigationLink(destination: ChiefAddView(person: self.person)) {
                    Text("Chief of Mission")
                }
        }
        .navigationBarTitle("Add a new role for \(person.lastName)")
    }
}

//struct InstanceAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        InstanceAddView(person: person)
//    }
//}
