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
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(person.getDisplayName())
                .font(.headline)
            
            HStack  {
                Text(person.birthYearString() ?? "No birth year identified")
                Text("-")
                Text(person.deathYearString() ?? "No year of death identified")
            }
            .font(.body)
            
            VStack(alignment: .leading) {
                Text(person.sex ?? "No sex identified.")
                Text(person.stateOfResidence?.getStateName() ?? "No state of residence identified.")
                Text(person.career?.rawValue ?? "No career type identified.")
            }
            .font(.body)
            
            List(roles) { instanceRole in
                PocomInstanceForPersonDetailViewRow(instance: instanceRole)
            }
            
        }
        .padding()
        .navigationBarTitle("\(person.firstName) \(person.lastName)")
            //        .navigationBarBackButtonHidden(true)
            //        .navigationBarItems(leading:
            //            NavigationLink(destination: ContentView()) {
            //                Text("Back Home")
            //        })
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
