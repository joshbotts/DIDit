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
        var chiefs = pocom.instancesForCountry(country: country)
        for chief in chiefs {
            if chief.person == nil {
                pocom.associatePerson(instance: chief)
            }
        }
        chiefs.sort { $0.sortDate() < $1.sortDate() }
        return chiefs
    }
    
    
    var body: some View {
        List(chiefsForCountry) { chief in
            ChiefRoleViewRow(chief: chief)
        }
        .navigationBarTitle("Chiefs of Mission in \(country.getCountryName())")
    }
}

//struct ChiefViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ChiefViewRow()
//    }
//}
