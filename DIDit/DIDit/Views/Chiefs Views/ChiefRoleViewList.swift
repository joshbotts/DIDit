//
//  ChiefRoleViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/8/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChiefRoleViewList: View {
    @EnvironmentObject var pocom: PocomStore
    var country: XmlCountry
    
    var chiefsForCountry: [PocomInstance] {
        let chiefs = pocom.instancesForCountry(country: country)
        for chief in chiefs {
            if chief.person == nil {
                pocom.associatePerson(instance: chief)
            }
        }
        return chiefs
    }
    
    
    var body: some View {
        List(chiefsForCountry) { chief in
            NavigationLink(destination: PersonViewDetail(person: chief.person!)) {
            ChiefRoleViewRow(chief: chief)
        }
        }
        .navigationBarTitle("Chiefs of Mission in \(country.getCountryName())")
    }
}

//struct ChiefViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ChiefViewRow()
//    }
//}
