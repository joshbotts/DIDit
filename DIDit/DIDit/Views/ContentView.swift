//
//  ContentView.swift
//  POCOM
//
//  Created by Joshua Botts on 10/23/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pocom: PocomStore
    
    var body: some View {
        NavigationView {
                    List {
                        NavigationLink(destination: PersonViewList()) {
                            HStack {
                                Image(systemName: "person.3.fill")
                                VStack(alignment: .leading)  {
                                    Text("View People Data")
                                    .font(.headline)
                                    Text("\(String(pocom.countPeople())) people")
                                }
                            }
                        }
                        NavigationLink(destination: PrincipalViewList()) {
                            HStack {
                                Image(systemName: "flag.circle.fill")
                                VStack(alignment: .leading) {
                                    Text("View Principal Officer Data")
                                        .font(.headline)
                                    Text("\(String(pocom.countPrincipals())) instances")
                                }
                            }
                        }
                            NavigationLink(destination: ChiefViewList()) {
                                HStack {
                                Image(systemName: "globe")
                                VStack(alignment: .leading) {
                                    Text("View Chief of Mission Data")
                                    .font(.headline)
                                    Text("\(String(pocom.countChiefs())) instances")
                                    }
                                }
                            }
                        NavigationLink(destination: PersonAddView()) {
                            HStack  {
                                Image(systemName: "person.badge.plus.fill")
                                Text("Add a new person")
                                    .font(.headline)
                            }
                        }
                        NavigationLink(destination: PersonForNewInstanceViewList()) {
                            HStack  {
                                Image(systemName: "flag.fill")
                                Text("Add a new chief of mission or principal officer role")
                                    .font(.headline)
                            }
                        }
                        NavigationLink(destination: WorkflowListView()) {
                            HStack {
                                Image(systemName: "square.and.arrow.up.on.square.fill")
                                Text("DID Team action items")
                                    .font(.headline)
                            }
                        }
                        Button("Delete all POCOM changes in this app") {
                            self.pocom.resetStore()
                        }
                }
                .navigationBarTitle("POCOM")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
