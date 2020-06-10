//
//  CSVExportAll.swift
//  DIDit
//
//  Created by Joshua Botts on 6/7/20.
//  Copyright © 2020 Joshua Botts. All rights reserved.
//

import SwiftUI

struct CSVExportAll: View {
    @EnvironmentObject var pocom: PocomStore
    
    var body: some View {
        VStack {
        Button("Copy person data as CSV")
            {
            var exportCSV: [String] = ["last name; first name; middle name; gen name; alt name; birth year; death year"]
            for person in self.pocom.people {
                exportCSV.append(person.exportPersonFullSCSV())
                print(person.lastName + " added to export array")
            }
            UIPasteboard.general.string = exportCSV.joined(separator: "\n")
        }
            Button("Copy principal instance data as CSV")
                {
                var exportCSV: [String] = ["person id; role; appointment date; duty date; end date; note"]
                for principal in self.pocom.principals {
                    self.pocom.associatePerson(instance: principal)
                    exportCSV.append(principal.exportPrincipalFullCSV() ?? "")
                    print(principal.person!.lastName + " " + principal.poRole!.getPORoleName() + " added to export array")
                }
                UIPasteboard.general.string = exportCSV.joined(separator: "\n")
            }
            Button("Copy chief instance data as CSV")
                {
                var exportCSV: [String] = ["person id; role; appointment date; duty date; end date; note"]
                for chief in self.pocom.chiefs {
                    self.pocom.associatePerson(instance: chief)
                    exportCSV.append(chief.exportChiefFullCSV() ?? "")
                    print(chief.person!.lastName + " " + chief.country!.getCountryName() + " added to export array")
                }
                UIPasteboard.general.string = exportCSV.joined(separator: "\n")
            }
            Spacer()
            Button("Copy person data as xml")
                {
                var exportCSV: [String] = []
                for person in self.pocom.people {
                    exportCSV.append(person.exportPersonXMLForAirTable())
                    print(person.lastName + " added to export array")
                }
                UIPasteboard.general.string = exportCSV.joined(separator: "\n")
            }
                Button("Copy principal instance data as xml")
                    {
                    var exportCSV: [String] = []
                    for principal in self.pocom.principals {
                        self.pocom.associatePerson(instance: principal)
                        exportCSV.append(principal.exportPrincipalXMLForAirTable() ?? "")
                        print(principal.person!.lastName + " " + principal.poRole!.getPORoleName() + " added to export array")
                    }
                    UIPasteboard.general.string = exportCSV.joined(separator: "\n")
                }
                Button("Copy chief instance data as xml")
                    {
                    var exportCSV: [String] = []
                    for chief in self.pocom.chiefs {
                        self.pocom.associatePerson(instance: chief)
                        exportCSV.append(chief.exportChiefXMLForAirTable() ?? "")
                        print(chief.person!.lastName + " " + chief.country!.getCountryName() + " added to export array")
                    }
                    UIPasteboard.general.string = exportCSV.joined(separator: "\n")
                }
    }
}
}

//struct CSVExportAll_Previews: PreviewProvider {
//    static var previews: some View {
//        CSVExportAll()
//    }
//}
