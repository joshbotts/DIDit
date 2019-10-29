//
//  PersonForNewInstanceViewList.swift
//  POCOM
//
//  Created by Joshua Botts on 10/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PersonForNewInstanceViewList: View {
    @EnvironmentObject var pocom: PocomStore
    @State private var searchQuery: String = ""
    @State private var queryString: String = ""
    @State private var searchBool: Bool = false
    
    var body: some View {
        VStack {
        TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
        if searchBool == true {
            PersonForInstanceViewSearchList(search: $queryString)
        }
        else
        {
            PersonForInstanceViewNoSearchList()
        }
        }
    .navigationBarTitle("Select person for new role")
    }
}

struct PersonForInstanceViewSearchList: View {
    @Binding var search: String
    @EnvironmentObject var pocom: PocomStore
    var people: [PocomPerson] {
        return pocom.sortPeople()
    }
    
    var body: some View {
        
        List {
            ForEach(people.filter {
                $0.id.contains(self.search.lowercased())
                },
                    id: \.self.id) { person in
                        NavigationLink(destination: InstanceAddView(person: person))
                        {
                            PersonViewRow(person: person)
                        }
            }
        }
    }
}

struct PersonForInstanceViewNoSearchList: View {
    @EnvironmentObject var pocom: PocomStore
    var people: [PocomPerson] {
        return pocom.sortPeople()
    }
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(destination: InstanceAddView(person: person))
                {
                    PersonViewRow(person: person)
                }
            }
        }
    }
}

//struct PersonForNewInstanceView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonForNewInstanceView()
//    }
//}
