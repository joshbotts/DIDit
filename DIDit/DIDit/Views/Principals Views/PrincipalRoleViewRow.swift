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
    
    var instanceNote: String {
        var note = ""
        if principal.note != nil {
            note = "\n" + principal.note!
        }
        return note
    }
    
    var instanceInformation: String {
        return principal.startDateString() + "\n" + principal.dutyDateString() + "\n" + principal.endDateString() + instanceNote
    }
    
    var body: some View {
            NavigationLink(destination: PrincipalEditView(principal: principal))  {
                HStack {
                    VStack(alignment: .leading) {
//                    NavigationLink(destination: PersonViewDetail(person: principal.person!)) {
                        Text(personName)
                        .font(.headline)
//                    }
                        Text(instanceInformation)
                        .font(.body)
                    }
                    Spacer()
                }
            }
    }
}

//struct PrincipalRoleViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalRoleViewRow()
//    }
//}
