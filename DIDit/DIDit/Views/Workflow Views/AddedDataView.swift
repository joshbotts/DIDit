//
//  AddedDataView.swift
//  POCOM
//
//  Created by Joshua Botts on 10/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct AddedDataView: View {
    @EnvironmentObject var pocom: PocomStore
    
    var peopleAdded: [PocomPerson] {
        var people: [PocomPerson] = []
        for person in self.pocom.people {
            if person.createdWith == DataSource.app {
                people.append(person)
            }
            people.sort { $0.id < $1.id }
        }
        return people
    }
    var principalsAdded: [PocomInstance] {
        var principals: [PocomInstance] = []
        for principal in self.pocom.principals {
            if principal.createdWith == DataSource.app {
                principals.append(principal)
            }
            principals.sort { $0.id < $1.id }
        }
        return principals
    }
    var chiefsAdded: [PocomInstance] {
        var chiefs: [PocomInstance] = []
        for chief in self.pocom.chiefs {
            if chief.createdWith == DataSource.app {
                chiefs.append(chief)
            }
            chiefs.sort { $0.id < $1.id }
        }
        return chiefs
    }
    
    var body: some View {
        VStack{
        List {
            ForEach(peopleAdded, id: \.self.id) { person in
                HStack {
                    Text(person.lastName)
                    Text(person.firstName)
                    Spacer()
                    Button("Copy xml element", action: {let exportedPerson = person.exportPersonElement()
                        UIPasteboard.general.string = exportedPerson})
                }
            }
        }
        List {
            ForEach(principalsAdded, id: \.self.id) { principal in
                HStack {
                    Text(principal.poRole!.getPORoleName())
                    Text(principal.personID)
                    Spacer()
                    Button("Copy xml element", action: {let exportedPrincipal = principal.exportPrincipalElement()
                        UIPasteboard.general.string = exportedPrincipal})
                }
            }
        }
        List {
            ForEach(chiefsAdded, id: \.self.id) { chief in
                HStack {
                    Text(chief.country!.getCountryName())
                    Text(chief.personID)
                    Spacer()
                    Button("Copy xml element", action: {let exportedChief = chief.exportChiefElement()
                        UIPasteboard.general.string = exportedChief})
                }
            }
        }
        .navigationBarTitle("App-generated POCOM Data")
        }
        
    }
}

struct AddedDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddedDataView()
    }
}
