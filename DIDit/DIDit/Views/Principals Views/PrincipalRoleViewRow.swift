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
    var personMiddleName: String {
        var middleName = ""
        pocom.associatePerson(instance: principal)
        if principal.person!.middleName  != nil {
            middleName = " " + principal.person!.middleName!
        }
        return middleName
    }
    var personGenName: String {
        var genName = ""
        pocom.associatePerson(instance: principal)
        if principal.person!.genName  != nil {
            genName = " " + principal.person!.genName!
        }
        return genName
    }
    var personName: String {
        pocom.associatePerson(instance: principal)
        return String(principal.person!.firstName + personMiddleName + " " + principal.person!.lastName + personGenName)
    }
    
    var instanceStartDate: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        if principal.dutyDate != nil {
            return principal.dutyDateString()
        } else if principal.startDate != nil {
            return principal.startDateString()
        } else if principal.nominationDate != nil {
            return "Nominated: " + perInstanceDateFormatter.string(from: principal.nominationDate!)
        } else {
            return "No start date identfied"
        }
    }
    
    var instanceEndDate: String {
        let perInstanceDateFormatter = DateFormatter()
        perInstanceDateFormatter.locale = Locale(identifier: "en_US")
        perInstanceDateFormatter.dateFormat = "MMMM dd, yyyy"
        if principal.endDate != nil {
            return principal.endDateString()
        } else if principal.nominationEndDate != nil {
            return "Nomination ended: " + perInstanceDateFormatter.string(from: principal.nominationEndDate!)
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
