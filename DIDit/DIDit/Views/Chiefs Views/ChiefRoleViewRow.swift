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
    
    var instanceNote: String {
        var note = ""
        if chief.note != nil {
            note = "\n" + chief.note!
        }
        return note
    }
    
    var instanceInformation: String {
        return chief.startDateString() + "\n" + chief.chargeDateString() + "\n" + chief.credentialDateString() + "\n" + chief.endDateString() + instanceNote
    }
    
    var body: some View {
                VStack(alignment: .leading) {
                    Text(personName)
                    .font(.headline)
                    Text(instanceInformation)
                    .font(.body)
                    .lineLimit(nil)
                    .layoutPriority(1)
                    .fixedSize(horizontal: false, vertical: true)
                    }
        }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
