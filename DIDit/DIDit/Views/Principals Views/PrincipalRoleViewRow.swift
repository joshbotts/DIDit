//
//  PrincipalRoleViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/8/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PrincipalRoleViewRow: View {
    @EnvironmentObject var pocom: PocomStore
    var principal: PocomInstance

    var personName: String {
        pocom.associatePerson(instance: principal)
        return String(principal.person!.getDisplayName())
    }
    
    var instanceInformation: String {
        return principal.startDateString() + "\n" + principal.dutyDateString() + "\n" + principal.endDateString()
    }
    
    var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(personName)
                        .font(.headline)
                    Text(instanceInformation)
                        .font(.body)
                    
                }
                Spacer()
//                NavigationLink(destination: PersonViewDetail(person: principal.person!)) {
//                    Text("View Person")
//                }
                VStack(alignment: .trailing) {
                NavigationLink(destination: PrincipalEditView(principal: principal))  {
                    Text("Edit Role Data")
                }
            }
        }
    }
}

//struct PrincipalRoleViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalRoleViewRow()
//    }
//}
