//
//  PrincipalAddView.swift
//  DID IT
//
//  Created by Joshua Botts on 10/15/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct PrincipalAddView: View {
    var person: PocomPerson
    @EnvironmentObject var pocom: PocomStore
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
            TextField("provenance (recommended)", text: self.$provenance)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Picker(selection: self.$poRole, label: Text("Principal Officer Role")) {
                    ForEach(XmlPrincipalOfficerRole.allCases, id: \.self.rawValue) { XmlPrincipalOfficerRole in
                        Text(XmlPrincipalOfficerRole.getPORoleName()).tag(XmlPrincipalOfficerRole)
                    }
                }
            }
            Section {
                DatePicker(selection: self.$startDate, in: ...Date(), displayedComponents: .date, label: { Text("Start date (optional)") })
                TextField("start note (optional)", text: self.$startNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$dutyDate, in: ...Date(), displayedComponents: .date, label: { Text("Duty date (optional)") })
                TextField("duty note (optional)", text: self.$dutyNote)
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
                Button("Save new principal role and copy xml element to clipboard")
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
                    var dutyDateForInit: Date?
                    if self.dutyDate == Date("3001-01-01") {
                        dutyDateForInit = nil
                    } else {
                        dutyDateForInit = self.dutyDate
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
                    var dutyNoteForInit: String?
                    if self.dutyNote == "" {
                        dutyNoteForInit = nil
                    } else {
                        dutyNoteForInit = self.dutyNote
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
                    let newPrincipalInstance = PocomInstance.init(poRole: self.poRole, person: self.person, startDate: startDateForInit, startNote: startNoteForInit, dutyDate: dutyDateForInit, dutyNote: dutyNoteForInit, endDate: endDateForInit, endNote: endNoteForInit, note: noteForInit, career: careerForInit, stateOfResidence: stateOfResidenceForInit, provenance: provenance)
                    self.pocom.appendPrincipal(newPrincipalInstance)
                    let exportedPrincipal = newPrincipalInstance.exportPrincipalElement()
                    UIPasteboard.general.string = exportedPrincipal
                }
            }
        }
        .navigationBarTitle("Add PO Role for \(person.lastName)")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading:
//            NavigationLink(destination: ContentView()) {
//                Text("Back Home")
//        })
        .navigationBarItems(trailing:
            NavigationLink(destination: PrincipalViewList()) {
                Text("Back to Principals Data")
        })
    }
    
}

//struct PrincipalAddView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalAddView()
//    }
//}
