//
//  ChiefAddView.swift
//  DID IT
//
//  Created by Joshua Botts on 10/15/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct ChiefAddView: View {
    var person: PocomPerson
    @EnvironmentObject var pocom: PocomStore
    @State var provenance: String = ""
    @State var country = XmlCountry.none
    @State var comRole = XmlCOMRole.none
    @State var startDate: Date = Date("3001-01-01")
    @State var startNote: String = ""
    @State var chargeDate: Date = Date("3001-01-01")
    @State var chargeNote: String = ""
    @State var credentialDate: Date = Date("3001-01-01")
    @State var credentialNote: String = ""
    @State var endDate: Date = Date("3001-01-01")
    @State var endNote: String = ""
    @State var note: String = ""
    @State var career: Career = Career.none
    @State var stateOfResidence: USState = USState.none
    
    var body: some View {
        Form {
            Section {
            TextField("provenance (recommended)", text: self.$provenance)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Picker(selection: self.$country, label: Text("Country")) {
                    ForEach(XmlCountry.allCases, id: \.self.rawValue) { XmlCountry in
                        Text(XmlCountry.getCountryName()).tag(XmlCountry)
                    }
                }
            }
            Section {
                Picker(selection: self.$comRole, label: Text("Chief of Mission role")) {
                    ForEach(XmlCOMRole.allCases, id: \.self.rawValue) { XmlCOMRole in
                        Text(XmlCOMRole.getTitle()).tag(XmlCOMRole)
                    }
                }
            }
            Section {
                DatePicker(selection: self.$startDate, in: ...Date(), displayedComponents: .date, label: { Text("Start date (optional)") })
                TextField("start note (optional)", text: self.$startNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$chargeDate, in: ...Date(), displayedComponents: .date, label: { Text("Charge date (optional)") })
                TextField("charge note (optional)", text: self.$chargeNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$credentialDate, in: ...Date(), displayedComponents: .date, label: { Text("Credential date (optional)") })
                TextField("credential note (optional)", text: self.$credentialNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$endDate, in: ...Date(), displayedComponents: .date, label: { Text("End date (optional)") })
                TextField("end note (optional)", text: self.$endNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("instance note (optional)", text: self.$note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Picker(selection: self.$career, label: Text("Career status override (optional)")) {
                    ForEach(Career.allCases, id: \.self.rawValue) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
            }
            Section {
                Picker(selection: self.$stateOfResidence, label: Text("State of residence override (optional)")) {
                    ForEach(USState.allCases, id: \.self.rawValue) { state in
                        Text(state.getStateName()).tag(state)
                    }
                }
            }
            Section {
                Button("Save new chief role and copy xml element to clipboard")
                {
                    var provenance: String?
                    if self.provenance == "" {
                        provenance = nil
                    } else {
                        provenance = self.provenance
                    }
                    var startDateForInit: Date?
                    if self.startDate == Date("3001-01-01") {
                        startDateForInit = nil
                    } else {
                        startDateForInit = self.startDate
                    }
                    var chargeDateForInit: Date?
                    if self.chargeDate == Date("3001-01-01") {
                        chargeDateForInit = nil
                    } else {
                        chargeDateForInit = self.chargeDate
                    }
                    var credentialDateForInit: Date?
                    if self.credentialDate == Date("3001-01-01") {
                        credentialDateForInit = nil
                    } else {
                        credentialDateForInit = self.credentialDate
                    }
                    var endDateForInit: Date?
                    if self.endDate == Date("3001-01-01") {
                        endDateForInit = nil
                    } else {
                        endDateForInit = self.endDate
                    }
                    var startNoteForInit: String?
                    if self.startNote == "" {
                        startNoteForInit = nil
                    } else {
                        startNoteForInit = self.startNote
                    }
                    var chargeNoteForInit: String?
                    if self.chargeNote == "" {
                        chargeNoteForInit = nil
                    } else {
                        chargeNoteForInit = self.chargeNote
                    }
                    var credentialNoteForInit: String?
                    if self.credentialNote == "" {
                        credentialNoteForInit = nil
                    } else {
                        credentialNoteForInit = self.credentialNote
                    }
                    var endNoteForInit: String?
                    if self.endNote == "" {
                        endNoteForInit = nil
                    } else {
                        endNoteForInit = self.endNote
                    }
                    var noteForInit: String?
                    if self.note == "" {
                        noteForInit = nil
                    } else {
                        noteForInit = self.note
                    }
                    var careerForInit: Career?
                    if self.career == .none {
                        careerForInit = nil
                    } else {
                        careerForInit = self.career
                    }
                    var stateOfResidenceForInit: USState?
                    if self.stateOfResidence == .none {
                        stateOfResidenceForInit = nil
                    } else {
                        stateOfResidenceForInit = self.stateOfResidence
                    }
                    let newChiefInstance = PocomInstance.init(comRole: self.comRole, country: self.country, person: self.person, startDate: startDateForInit, startNote: startNoteForInit, chargeDate: chargeDateForInit, chargeNote: chargeNoteForInit, credentialDate: credentialDateForInit, credentialNote: credentialNoteForInit, endDate: endDateForInit, endNote: endNoteForInit, note: noteForInit, career: careerForInit, stateOfResidence: stateOfResidenceForInit, provenance: provenance)
                    self.pocom.appendChief(newChiefInstance)
                    let exportedChief = newChiefInstance.exportChiefElement()
                    UIPasteboard.general.string = exportedChief
                }
            }
            
        }
        .navigationBarTitle("Add COM Role for \(person.lastName)")
    }
    
}

struct ChiefAddView_Previews: PreviewProvider {
    static var previews: some View {
        ChiefAddView(person: PocomPerson(firstName: "Joshua", lastName: "Botts", middleName: "D.", genName: nil, altName: "Josh Botts", birthYear: 1979, deathYear: nil, career: Career.nonCareer, stateOfResidence: USState.maryland, sex: "Male", provenance: "me, myself, and I"))
    }
}
