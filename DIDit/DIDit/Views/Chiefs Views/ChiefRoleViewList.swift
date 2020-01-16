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
            NavigationLink(destination: ChiefEditView(chief: chief)) {
            ChiefRoleViewRow(chief: chief)
            .contextMenu {
                Button(action:
                    {
                        UIPasteboard.general.string = chief.exportChiefElement()
                    })
                    {
                        Text("Copy Principal Role XML Element")
                        Image(systemName: "doc.on.doc.fill")
                    }
                Button(action:
                    {
                        UIPasteboard.general.string = chief.exportChiefJson()
                    })
                    {
                        Text("Copy Principal Role JSON Data")
                        Image(systemName: "doc.on.doc")
                }
                Button(action:
                    {
                        self.pocom.deleteInstance(instance: chief)
                    })
                    {
                        Text("Delete Principal Role")
                        Image(systemName: "trash.fill")
                    
                    }
            }
            }
        }
        .navigationBarTitle("Chiefs of Mission in \(country.getCountryName())")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading:
//            NavigationLink(destination: ContentView()) {
//                Text("Back Home")
//        })
        .navigationBarItems(trailing:
            NavigationLink(destination: ChiefViewList()) {
                Text("Back to Chiefs Data")
        })
    }
}

//struct ChiefViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ChiefViewRow()
//    }
//}
