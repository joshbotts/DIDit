//
//  PersonAddView.swift
//  DID IT
//
//  Created by Joshua Botts on 10/15/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct PersonAddView: View {
    
    @EnvironmentObject var pocom: PocomStore
    
    @State var provenance: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var middleName: String = ""
    @State var genName: String = ""
    @State var altName: String = ""
    @State var birthYear: String = ""
    @State var deathYear: String = ""
    @State var career: Career = Career.none
    @State var stateOfResidence: USState = USState.none
    @State var sex: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("provenance (recommended)", text: self.$provenance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("first name", text: self.$firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("middle name (optional)", text: self.$middleName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("last name", text: self.$lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("generational name (optional)", text: self.$genName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("alternate/common name (optional)", text: self.$altName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("birth year (optional)", text: self.$birthYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("death year (optional)", text: self.$deathYear)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("sex (optional)", text: self.$sex)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Picker(selection: self.$career, label: Text("Career status")) {
                    ForEach(Career.allCases, id: \.self.rawValue) { status in
                        Text(status.rawValue).tag(status)
               }
                }
            }
            Section {
                Picker(selection: self.$stateOfResidence, label: Text("State of residence")) {
                ForEach(USState.allCases, id: \.self.rawValue) { state in
                    Text(state.getStateName()).tag(state)
               }
            }
            }
            Section {
            Button("Save new person and copy xml element to clipboard")
                {
                    var provenance: String?
                    if self.provenance == "" {
                        provenance = nil
                    } else {
                        provenance = self.provenance
                    }
                    var middleName: String?
                    if self.middleName == "" {
                        middleName = nil
                    } else {
                        middleName = self.middleName
                    }
                    var genName: String?
                    if self.genName == "" {
                        genName = nil
                    } else {
                        genName = self.genName
                    }
                    var altName: String?
                    if self.altName == "" {
                        altName = nil
                    } else {
                        altName = self.altName
                    }
                    var birthYearInt: Int?
                    if self.birthYear == "" {
                        birthYearInt = nil
                    } else {
                        birthYearInt = Int(self.birthYear)
                    }
                    var deathYearInt: Int?
                    if self.deathYear == "" {
                        deathYearInt = nil
                    } else {
                        deathYearInt = Int(self.deathYear)
                    }
                    var sex: String?
                    if self.sex == "" {
                        sex = nil
                    } else {
                        sex = self.sex
                    }
                    let newPerson = PocomPerson.init(firstName: self.firstName, lastName: self.lastName, middleName: middleName, genName: genName, altName: altName, birthYear: birthYearInt, deathYear: deathYearInt, career: self.career, stateOfResidence: self.stateOfResidence, sex: sex, provenance: provenance)
                    self.pocom.appendPerson(newPerson)
                    let exportedPerson = newPerson.exportPersonElement()
                    UIPasteboard.general.string = exportedPerson
                }
            }
            
        }
        .navigationBarTitle("Add Person")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading:
//            NavigationLink(destination: ContentView()) {
//                Text("Back Home")
//        })
        .navigationBarItems(trailing:
            NavigationLink(destination: PersonViewList()) {
                Text("Back to People Data")
        })
    }
    
}

struct PersonAddView_Previews: PreviewProvider {
    static var previews: some View {
        PersonAddView()
    }
}
