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
    var personMiddleName: String {
        var middleName = ""
        pocom.associatePerson(instance: chief)
        if chief.person!.middleName  != nil {
            middleName = chief.person!.middleName!
        }
        return middleName
    }
    var personGenName: String {
        var genName = ""
        pocom.associatePerson(instance: chief)
        if chief.person!.genName  != nil {
            genName = chief.person!.genName!
        }
        return genName
    }
    var personName: String {
        pocom.associatePerson(instance: chief)
        return String(chief.person!.firstName + " " + personMiddleName + " " + chief.person!.lastName + " " + personGenName)
    }
    
    var instanceStartDate: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        if chief.chargeDate != nil {
            return "Assumed charge: " + perInstanceDateFormatter.string(from: chief.chargeDate!)
        } else if chief.credentialDate != nil {
            return "Presented credentials: " + perInstanceDateFormatter.string(from: chief.credentialDate!)
        } else if chief.startDate != nil {
            return "Appointed:  " + perInstanceDateFormatter.string(from: chief.startDate!)
        } else if chief.nominationDate != nil {
            return "Nominated: " + perInstanceDateFormatter.string(from: chief.nominationDate!)
        } else {
            return "No start date identified"
        }
    }
    
    var instanceEndDate: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        if chief.endDate != nil {
            return "Relinquished charge: " + perInstanceDateFormatter.string(from: chief.endDate!)
        } else if chief.nominationEndDate != nil {
            return "Nomination ended: "  + perInstanceDateFormatter.string(from: chief.nominationEndDate!)
        } else {
            return "No end date identified"
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(personName)
                    .font(.headline)
                Text(instanceStartDate)
                    .font(.body)
                Text(instanceEndDate)
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
