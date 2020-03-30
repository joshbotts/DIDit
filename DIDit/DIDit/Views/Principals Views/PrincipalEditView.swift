//
//  PrincipalEditView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/29/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct PrincipalEditView: View {
    @ObservedObject var principal: PocomInstance
    @EnvironmentObject var pocom: PocomStore
    @State var provenance: String = ""
    @State var startDate: Date = Date("3001-01-01")
    @State var startNote: String = ""
    @State var dutyDate: Date = Date("3001-01-01")
    @State var dutyNote: String = ""
    @State var endDate: Date = Date("3001-01-01")
    @State var endNote: String = ""
    @State var note: String = ""

    var body: some View {
        Form {
            Section {
                TextField("Provenance: (recommended) \(principal.provenance ?? "")", text: self.$provenance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                DatePicker(selection: self.$startDate, in: ...Date(), displayedComponents: .date, label: { Text("Appointment date: (optional) \(principal.startDateString())") })
                TextField("Start note: (optional) \(principal.startNote ?? "")", text: self.$startNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$dutyDate, in: ...Date(), displayedComponents: .date, label: { Text("Duty date: (optional) \(principal.dutyDateString())") })
                TextField("Duty note: (optional) \(principal.dutyNote ?? "")", text: self.$dutyNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                DatePicker(selection: self.$endDate, in: ...Date(), displayedComponents: .date, label: { Text("End date: (optional) \(principal.endDateString())") })
                TextField("End note: (optional) \(principal.endNote ?? "")", text: self.$endNote)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Instance note: (optional) \(principal.note ?? "")", text: self.$note)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Section {
                Button("Save edited role and copy xml element to clipboard")
                {
                    let currentDate = Date()
                    let didDateFormatter = DateFormatter()
                    didDateFormatter.locale = Locale(identifier: "en_US")
                    didDateFormatter.dateFormat = "yyyy-MM-dd"
                    let currentDateString = didDateFormatter.string(from: currentDate)
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
                    var dutyNote: String? = self.dutyNote
                    if self.dutyNote == "" {
                        dutyNote = self.principal.dutyNote
                    }
                   var endNote: String? = self.endNote
                    if self.endNote == "" {
                        endNote = self.principal.endNote
                    }
                    var note: String? = self.note
                    if self.note == "" {
                        note = self.principal.note
                    }
                    self.principal.startDate = startDate
                    self.principal.startNote = startNote
                    self.principal.dutyDate = dutyDate
                    self.principal.dutyNote = dutyNote
                    self.principal.endDate = endDate
                    self.principal.endNote = endNote
                    self.principal.note = note
                    self.principal.provenance = provenance
                    self.principal.createdWith = DataSource.app
                    self.principal.modificationDate = currentDateString
                    self.principal.modificationBy = "DIDit.app"
                    UIPasteboard.general.string = self.principal.exportPrincipalElement()
                }
            }

        }
    .padding()
        .navigationBarTitle("Edit PO Role")
        .navigationBarItems(trailing:
            NavigationLink(destination: PrincipalViewList()) {
                Text("Back to Principals Data")
        })
    }
    }

//struct PrincipalEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalEditView()
//    }
//}
