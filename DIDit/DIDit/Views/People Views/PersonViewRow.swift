//
//  PersonViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/3/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PersonViewRow: View {
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
    var personForeName: String {
        return String(person.firstName + personMiddleName + personGenName)
    }
    
    var body: some View {
            HStack {
                Text(person.lastName)
                .bold()
                Text(personForeName)
            }
    }
}

//struct PersonViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonViewRow()
//    }
//}
