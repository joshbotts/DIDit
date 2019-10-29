//
//  PersonViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/3/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PersonWithoutBirthYearViewList: View {
    @EnvironmentObject var pocom: PocomStore
    @State private var searchQuery: String = ""
    @State private var queryString: String = ""
    @State private var searchBool: Bool = false
    
    
    var body: some View {
        VStack {
        TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
        if searchBool == true {
            PersonWithoutBirthYearViewSearchList(search: $queryString)
        }
        else
        {
            PersonWithoutBirthYearViewNoSearchList()
        }
        }
        .navigationBarTitle("People")
    }
}

struct PersonWithoutBirthYearViewSearchList: View {
    @Binding var search: String
    @EnvironmentObject var pocom: PocomStore
    var people: [PocomPerson] {
        var peopleWithoutBirthYear: [PocomPerson] = []
        for person in pocom.people {
            if person.birthYear == nil {
                peopleWithoutBirthYear.append(person)
            }
        }
        peopleWithoutBirthYear.sort { $0.id < $1.id }
        return peopleWithoutBirthYear
    }
    
    var body: some View {
        List {
            ForEach(people.filter {
                $0.id.contains(self.search.lowercased())
                },
                    id: \.self.id) { person in
                        NavigationLink(destination: PersonViewDetail(person: person))
                        {
                            PersonViewRow(person: person)
                        }
            }
        }
    }
}

struct PersonWithoutBirthYearViewNoSearchList: View {
    @EnvironmentObject var pocom: PocomStore
    var people: [PocomPerson] {
        var peopleWithoutBirthYear: [PocomPerson] = []
        for person in pocom.people {
            if person.birthYear == nil {
                peopleWithoutBirthYear.append(person)
            }
        }
        peopleWithoutBirthYear.sort { $0.id < $1.id }
        return peopleWithoutBirthYear
    }
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(destination: PersonViewDetail(person: person))
                {
                    PersonViewRow(person: person)
                }
            }
        }
    }
}

//struct PersonViewList_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonViewList()
//    }
//}
