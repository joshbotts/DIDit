//
//  ChiefEditView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/29/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI
import Combine

struct ChiefEditView: View {
@ObservedObject var chief: PocomInstance
@EnvironmentObject var pocom: PocomStore
@State var provenance: String = ""
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
    
var body: some View {
    Form {
        Section {
            TextField("Provenance: (recommended)  \(chief.provenance ?? "")", text: self.$provenance)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        Section {
            Picker(selection: self.$comRole, label: Text("Chief of Mission role")) {
                ForEach(XmlCOMRole.allCases, id: \.self.rawValue) { XmlCOMRole in
                    Text(XmlCOMRole.getTitle()).tag(XmlCOMRole)
                }
            }
        }
        Section {
            DatePicker(selection: self.$startDate, in: ...Date(), displayedComponents: .date, label: { Text("Appointment date: (optional) \(chief.startDateString())") })
            TextField("Start note: (optional) \(chief.startNote ?? "")", text: self.$startNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DatePicker(selection: self.$chargeDate, in: ...Date(), displayedComponents: .date, label: { Text("Charge date: (optional) \(chief.chargeDateString())") })
            TextField("Charge note: (optional) \(chief.chargeNote ?? "")", text: self.$chargeNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DatePicker(selection: self.$credentialDate, in: ...Date(), displayedComponents: .date, label: { Text("Credential date: (optional) \(chief.credentialDateString())") })
            TextField("Credential note: (optional) \(chief.credentialNote ?? "")", text: self.$credentialNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            DatePicker(selection: self.$endDate, in: ...Date(), displayedComponents: .date, label: { Text("End date: (optional) \(chief.endDateString())") })
            TextField("End note: (optional) \(chief.endNote ?? "")", text: self.$endNote)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Instance note: (optional) \(chief.note ?? "")", text: self.$note)
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
                var comRole: XmlCOMRole = self.comRole
                if self.comRole == .none {
                    comRole = self.chief.comRole!
                }
                var provenance: String? = self.provenance
                if self.provenance == "" {
                    provenance = self.chief.provenance
                }
                var startDate: Date? = self.startDate
                if self.startDate == Date("3001-01-01") {
                    startDate = self.chief.startDate
                }
                var chargeDate: Date? = self.chargeDate
                if self.chargeDate == Date("3001-01-01") {
                    chargeDate = self.chief.chargeDate
                }
                var credentialDate: Date? = self.credentialDate
                if self.credentialDate == Date("3001-01-01") {
                    credentialDate = self.chief.credentialDate
                }
                var endDate: Date? = self.endDate
                if self.endDate == Date("3001-01-01") {
                    endDate = self.chief.endDate
                }
                var startNote: String? = self.startNote
                if self.startNote == "" {
                    startNote = self.chief.startNote
                }
                var chargeNote: String? = self.chargeNote
                if self.chargeNote == "" {
                    chargeNote = self.chief.chargeNote
                }
                var credentialNote: String? = self.credentialNote
                if self.credentialNote == "" {
                    credentialNote = self.chief.credentialNote
                }
               var endNote: String? = self.endNote
                if self.endNote == "" {
                    endNote = self.chief.endNote
                }
                var note: String? = self.note
                if self.note == "" {
                    note = self.chief.note
                }
                self.chief.comRole = comRole
                self.chief.startDate = startDate
                self.chief.startNote = startNote
                self.chief.chargeDate = chargeDate
                self.chief.chargeNote = chargeNote
                self.chief.credentialDate = credentialDate
                self.chief.credentialNote = credentialNote
                self.chief.endDate = endDate
                self.chief.endNote = endNote
                self.chief.note = note
                self.chief.provenance = provenance
                self.chief.createdWith = DataSource.app
                self.chief.modificationDate = currentDateString
                self.chief.modificationBy = "DIDit.app"
                UIPasteboard.general.string = self.chief.exportChiefElement()
            }
        }
        
    }
.padding()
    .navigationBarTitle("Edit COM Role")
    .navigationBarItems(trailing:
        NavigationLink(destination: ChiefViewList()) {
            Text("Back to Chiefs Data")
    })
}
}


//struct ChiefEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChiefEditView()
//    }
//}
