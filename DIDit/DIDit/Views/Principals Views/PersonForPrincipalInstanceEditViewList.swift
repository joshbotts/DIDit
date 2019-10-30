//
//  PersonForNewInstanceViewList.swift
//  POCOM
//
//  Created by Joshua Botts on 10/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

//import SwiftUI
//import Combine
//
//struct PersonForPrincipalInstanceEditViewList: View {
//    @EnvironmentObject var pocom: PocomStore
//    var principal: PocomInstance
//    @State private var searchQuery: String = ""
//    @State private var queryString: String = ""
//    @State private var searchBool: Bool = false
//
//    var body: some View {
//        VStack {
//        TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
//        if searchBool == true {
//            PersonForPrincipalInstanceEditViewSearchList(principal: self.principal, search: $queryString)
//        }
//        else
//        {
//            PersonForPrincipalInstanceEditViewNoSearchList(principal: self.principal)
//        }
//        }
//    .navigationBarTitle("Select person for new role")
//    }
//}
//
//struct PersonForPrincipalInstanceEditViewSearchList: View {
//    var principal: PocomInstance
//    @Binding var search: String
//    @EnvironmentObject var pocom: PocomStore
//    var people: [PocomPerson] {
//        return pocom.sortPeople()
//    }
//
//    var body: some View {
//
//        List {
//            ForEach(people.filter {
//                $0.id.contains(self.search.lowercased())
//                },
//                    id: \.self.id) { person in
//                        NavigationLink(destination: PrincipalEditView(principal: self.principal, person: person))
//                        {
//                            PersonViewRow(person: person)
//                        }
//            }
//        }
//    }
//}
//
//struct PersonForPrincipalInstanceEditViewNoSearchList: View {
//    var principal: PocomInstance
//    @EnvironmentObject var pocom: PocomStore
//    var people: [PocomPerson] {
//        return pocom.sortPeople()
//    }
//
//    var body: some View {
//        List {
//            ForEach(people) { person in
//                NavigationLink(destination: PrincipalEditView(principal: self.principal, person: person))
//                {
//                    PersonViewRow(person: person)
//                }
//            }
//        }
//    }
//}

//struct PersonForNewInstanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonForNewInstanceView()
//    }
//}
