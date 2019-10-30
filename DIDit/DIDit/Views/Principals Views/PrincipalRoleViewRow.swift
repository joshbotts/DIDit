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
            return "Entered on Duty: " + perInstanceDateFormatter.string(from: principal.dutyDate!)
        } else if principal.startDate != nil {
            return "Appointed: " + perInstanceDateFormatter.string(from: principal.startDate!)
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
            return "Termination of Appointment: " + perInstanceDateFormatter.string(from: principal.endDate!)
        } else if principal.nominationEndDate != nil {
            return "Nomination ended: " + perInstanceDateFormatter.string(from: principal.nominationEndDate!)
        } else {
            return "No end date identified"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
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
//                NavigationLink(destination: PrincipalEditView(principal: principal))  {
//                Text("Edit Role")
//                    }
            }
    }
}
}

//struct PrincipalRoleViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalRoleViewRow()
//    }
//}
