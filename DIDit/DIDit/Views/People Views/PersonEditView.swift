////
////  PersonEditView.swift
////  DID IT
////
////  Created by Joshua Botts on 10/15/19.
////  Copyright © 2019 Joshua Botts. All rights reserved.
////

import SwiftUI
import Combine

struct PersonEditView: View {
    @ObservedObject var person: PocomPerson
    @EnvironmentObject var pocom: PocomStore
    
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
    @State var provenance: String = ""
    var personBirthYear: String? {
    if person.birthYear != nil {
    return String(person.birthYear!)
    } else {
        return nil
        }
    }
    var personDeathYear: String? {
        if person.deathYear != nil {
        return String(person.deathYear!)
        } else {
            return nil
            }
    }
    
    var body: some View {
        Form {
            Section {
                TextField(person.provenance ?? "provenance (recommended)", text: self.$provenance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.firstName, text: self.$firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.middleName ?? "middle name (optional)", text: self.$middleName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.lastName, text: self.$lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.genName ?? "generational name (optional)", text: self.$genName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.altName ?? "alternate/common name (optional)", text: self.$altName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(personBirthYear ?? "birth year (optional)", text: self.$birthYear)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(personDeathYear ?? "death year (optional)", text: self.$deathYear)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(person.sex ?? "sex (optional)", text: self.$sex)
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
                Button(action: {
                    let currentDate = Date()
                    let didDateFormatter = DateFormatter()
                    didDateFormatter.locale = Locale(identifier: "en_US")
                    didDateFormatter.dateFormat = "yyyy-MM-dd"
                    let currentDateString = didDateFormatter.string(from: currentDate)
                    var provenance: String? = self.provenance
                    if self.provenance == "" {
                        provenance = self.person.provenance
                    }
                    var firstName: String = self.firstName
                    if self.firstName == "" {
                        firstName = self.person.firstName
                    }
                    var lastName: String = self.lastName
                    if self.lastName == "" {
                        lastName = self.person.lastName
                    }
                    var middleName: String? = self.middleName
                    if self.middleName == "" {
                        middleName = self.person.middleName
                    }
                    var genName: String? = self.genName
                    if self.genName == "" {
                        genName = self.person.genName
                    }
                    var altName: String? = self.altName
                    if self.altName == "" {
                        altName = self.person.altName
                    }
                    var birthYearString: String? = self.birthYear
                    if self.birthYear == "" {
                        if self.person.birthYear != nil {
                            birthYearString = String(self.person.birthYear!)
                        } else {
                            birthYearString = ""
                        }
                    }
                    var birthYearInt: Int? = nil
                    if birthYearString != nil {
                            birthYearInt = Int(birthYearString!)
                        }
                    var deathYearString: String? = self.deathYear
                    if self.deathYear == "" {
                        if self.person.deathYear != nil {
                            deathYearString = String(self.person.deathYear!)
                        } else {
                            deathYearString = ""
                        }
                    }
                    var deathYearInt: Int? = nil
                    if deathYearString != nil {
                            deathYearInt = Int(deathYearString!)
                        }
                    var sex: String? = self.sex
                    if self.sex == "" {
                        sex = self.person.sex
                    }
                    var career: Career? = self.career
                    if self.career == .none {
                        career = self.person.career
                    }
                    var state: USState? = self.stateOfResidence
                    if self.stateOfResidence == .none {
                        state = self.person.stateOfResidence
                    }
                    self.person.firstName = firstName
                    self.person.lastName = lastName
                    self.person.middleName = middleName
                    self.person.genName = genName
                    self.person.altName = altName
                    self.person.birthYear = birthYearInt
                    self.person.deathYear = deathYearInt
                    self.person.career = career
                    self.person.stateOfResidence = state
                    self.person.sex = sex
                    self.person.createdWith = DataSource.app
                    self.person.modificationDate = currentDateString
                    self.person.modificationBy = "DIDit.app"
                    self.person.provenance = provenance
                    UIPasteboard.general.string = self.person.exportPersonElement()
                }) {
                    Text("Edit person and copy xml element to clipboard")
                }
            }
        }
        .navigationBarTitle("Edit \(person.lastName)")
        .navigationBarBackButtonHidden(true)
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

////struct PersonEditView_Previews: PreviewProvider {
////    static var previews: some View {
////        PersonEditView()
////    }
////}
