//
//  ChiefRoleViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChiefRoleViewRow: View {
    @EnvironmentObject var pocom: PocomStore
    var chief: PocomInstance

    var personName: String {
        pocom.associatePerson(instance: chief)
        return String(chief.person!.getDisplayName())
    }
    
    var instanceInformation: String {
        return chief.startDateString() + "\n" + chief.chargeDateString() + "\n" + chief.credentialDateString() + "\n" + chief.endDateString()
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
//            NavigationLink(destination: PersonViewDetail(person: chief.person!)) {
//                Text("View Person")
//            }
            VStack(alignment: .trailing) {
            NavigationLink(destination: ChiefEditView(chief: chief)) {
                Text("Edit Role Data")
            }
            }
        }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
