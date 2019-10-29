//
//  PrincipalEditView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/29/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PrincipalEditView: View {
    @ObservedObject var principal: PocomInstance
    @EnvironmentObject var pocom: PocomStore
    var person: PocomPerson
    @State var provenance: String = ""
    @State var poRole = XmlPrincipalOfficerRole.none
    @State var startDate: Date = Date("3001-01-01")
    @State var startNote: String = ""
    @State var dutyDate: Date = Date("3001-01-01")
    @State var dutyNote: String = ""
    @State var endDate: Date = Date("3001-01-01")
    @State var endNote: String = ""
    @State var note: String = ""
    @State var career: Career = Career.none
    @State var stateOfResidence: USState = USState.none

    var body: some View {
        Form {
            Section {
                TextField(principal.provenance ?? "provenance (recommended)", text: self.$provenance)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Picker(selection: self.$poRole, label: Text("Principal Officer role")) {
                    ForEach(XmlPrincipalOfficerRole.allCases, id: \.self.rawValue) { XmlPrincipalOfficer in
                        Text(XmlPrincipalOfficerRole.getPORoleName()).tag(XmlPrincipalOfficerRole)
                    }
                }
            }
            Section {
                DatePicker(selection: self.$startDate, in: ...Date(), displayedComponents: .date, label: { Text("Start date (optional)") })
                TextField(principal.startNote ?? "start note (optional)", text: self.$startNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$dutyDate, in: ...Date(), displayedComponents: .date, label: { Text("Charge date (optional)") })
                TextField(principal.dutyNote ?? "charge note (optional)", text: self.$chargeNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$endDate, in: ...Date(), displayedComponents: .date, label: { Text("End date (optional)") })
                TextField(principal.endNote ?? "end note (optional)", text: self.$endNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField(principal.note ?? "instance note (optional)", text: self.$note)
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
                Button("Save new principal role and copy xml element to clipboard")
                {
                    let currentDate = Date()
                    let didDateFormatter = DateFormatter()
                    didDateFormatter.locale = Locale(identifier: "en_US")
                    didDateFormatter.dateFormat = "yyyy-MM-dd"
                    let currentDateString = didDateFormatter.string(from: currentDate)
                    var poRole: XmlPrincipalOfficerRole = self.poRole
                    if self.poRole == .none {
                        poRole = self.principal.poRole!
                    }
                    var provenance: String? = self.provenance
                    if self.provenance == "" {
                        provenance = self.principal.provenance
                    }
                    var startDate: Date? = self.startDate
                    if self.startDate == Date("3001-01-01") {
                        startDate = self.principal.startDate
                    }
                    var dutyDate: Date? = self.dutyDate
                    if self.dutyDate == Date("3001-01-01") {
                        dutyDate = self.principal.dutyDate
                    }
                    var endDate: Date? = self.endDate
                    if self.endDate == Date("3001-01-01") {
                        endDate = self.principal.endDate
                    }
                    var startNote: String? = self.startNote
                    if self.startNote == "" {
                        startNote = self.principal.startNote
                    }
                    var chargeNote: String? = self.chargeNote
                    if self.chargeNote == "" {
                        chargeNote = self.principal.chargeNote
                    }
                    var credentialNote: String? = self.credentialNote
                    if self.credentialNote == "" {
                        credentialNote = self.principal.credentialNote
                    }
                   var endNote: String? = self.endNote
                    if self.endNote == "" {
                        endNote = self.principal.endNote
                    }
                    var note: String? = self.note
                    if self.note == "" {
                        note = self.principal.note
                    }
                    var career: Career? = self.career
                    if self.career == .none {
                        career = self.principal.careerFsoOverride
                    }
                    var state: USState? = self.stateOfResidence
                    if self.stateOfResidence == .none {
                        state = self.principal.stateOfResidenceOverride
                    }
                    self.principal.poRole = poRole
                    self.principal.person = self.person
                    self.principal.startDate = startDate
                    self.principal.startNote = startNote
                    self.principal.dutyDate = dutyDate
                    self.principal.dutyNote = dutyNote
                    self.principal.endDate = endDate
                    self.principal.endNote = endNote
                    self.principal.note = note
                    self.principal.careerFsoOverride = career
                    self.principal.stateOfResidenceOverride = state
                    self.principal.provenance = provenance
                    self.principal.createdWith = DataSource.app
                    self.principal.modificationDate = currentDateString
                    self.principal.modificationBy = "DIDit.app"
                    UIPasteboard.general.string = principal.exportPrincipalElement()
                }
            }
            
        }
        .navigationBarTitle("Edit COM Role for \(person.lastName)")
    }
    }

//struct PrincipalEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalEditView()
//    }
//}
