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
    var instanceDataAdded: [PocomInstance] {
        return chiefsAdded + principalsAdded
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
            Button("Copy selected xml elements to clipboard") {
                let instancesToExport = self.pocom.export
                var exportedElements: [String] = []
                for instance in instancesToExport {
                    if type(of: instance) == PocomPerson.self {
                        exportedElements.append((instance as! PocomPerson).exportPersonElement())
                    }
                    if type(of: instance) == PocomInstance.self {
                        if (instance as! PocomInstance).instanceType == .chief {
                            exportedElements.append((instance as! PocomInstance).exportChiefElement())
                        } else {
                            exportedElements.append((instance as! PocomInstance).exportPrincipalElement())
                        }
                    }
                }
                UIPasteboard.general.string = exportedElements.joined(separator: "\n\n")
            }
                Spacer()
            Button("Save selected xml elements to disk") {
                let instancesToExport = self.pocom.export
                var exportedElements: [String] = []
                for instance in instancesToExport {
                    if type(of: instance) == PocomPerson.self {
                        exportedElements.append((instance as! PocomPerson).exportPersonElement())
                    }
                    if type(of: instance) == PocomInstance.self {
                        if (instance as! PocomInstance).instanceType == .chief {
                            exportedElements.append((instance as! PocomInstance).exportChiefElement())
                        } else {
                            exportedElements.append((instance as! PocomInstance).exportPrincipalElement())
                        }
                    }
                }
                let elementsToSave = exportedElements.joined(separator: "\n\n")
                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                        let exportedElementArchiveURL = documentsDirectory.appendingPathComponent("exportedElements").appendingPathExtension("txt")
                        try? elementsToSave.write(to: exportedElementArchiveURL, atomically: true, encoding: String.Encoding.utf8)
            }
            }
            HStack {
                Button("Copy selected json to clipboard") {
                    let instancesToExport = self.pocom.export
                    var exportedElements: [String] = []
                    for instance in instancesToExport {
                        if type(of: instance) == PocomPerson.self {
                            exportedElements.append((instance as! PocomPerson).exportPersonJson())
                        }
                        if type(of: instance) == PocomInstance.self {
                            if (instance as! PocomInstance).instanceType == .chief {
                                exportedElements.append((instance as! PocomInstance).exportChiefJson())
                            } else {
                                exportedElements.append((instance as! PocomInstance).exportPrincipalJson())
                            }
                        }
                    }
                    UIPasteboard.general.string = exportedElements.joined(separator: ",\n")
                }
                Spacer()
                Button("Save selected json to disk") {
                    let instancesToExport = self.pocom.export
                    var exportedElements: [String] = []
                    for instance in instancesToExport {
                        if type(of: instance) == PocomPerson.self {
                            exportedElements.append((instance as! PocomPerson).exportPersonJson())
                        }
                        if type(of: instance) == PocomInstance.self {
                            if (instance as! PocomInstance).instanceType == .chief {
                                exportedElements.append((instance as! PocomInstance).exportChiefJson())
                            } else {
                                exportedElements.append((instance as! PocomInstance).exportPrincipalJson())
                            }
                        }
                    }
                    let elementsToSave = exportedElements.joined(separator: ",\n")
                    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let currentDate = Date()
                    let didDateFormatter = DateFormatter()
                    didDateFormatter.locale = Locale(identifier: "en_US")
                    didDateFormatter.dateFormat = "yyyy-MM-dd"
                    let currentDateString = didDateFormatter.string(from: currentDate)
                    let exportedJsonArchiveURL = documentsDirectory.appendingPathComponent("\(currentDateString).exportedJson").appendingPathExtension("txt")
                    try? elementsToSave.write(to: exportedJsonArchiveURL, atomically: true, encoding: String.Encoding.utf8)
                }
            }
            .padding()
            List(peopleAdded) { instance in
                AddedDataRowView(instance: instance)
            }
            List(instanceDataAdded) { instance in
                AddedDataRowView(instance: instance)
            }
            
        }
        .navigationBarTitle("App-generated POCOM Data")
    }
    
}

struct AddedDataRowView: View {
    @EnvironmentObject var pocom: PocomStore
    var instance: Any
    var addedDescription: String {
        var description: String = ""
        if type(of: self.instance) == PocomPerson.self {
            description = (self.instance as! PocomPerson).lastName + " " + (self.instance as! PocomPerson).firstName
        }
        if type(of: self.instance) == PocomInstance.self {
            if (instance as! PocomInstance).instanceType == .principal {
                description = (instance as! PocomInstance).poRole!.getPORoleName() + " " + (instance as! PocomInstance).personID
            } else {
                description = (instance as! PocomInstance).country!.getCountryName() + " " + (instance as! PocomInstance).personID
            }
        }
        return description
    }
    @State var export: Bool = false
    func toggleExport() {
        export = !export
    }
    
    var body: some View {
        HStack {
            Text(addedDescription)
            Spacer()
            Button(action:
                {
                    self.toggleExport()
                    if self.export == true {
                        self.pocom.export.append(self.instance)
                    }
            }) {
                Text(export ? "Cancel Export?" : "Export?")
            }
        }
    }
}

struct AddedDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddedDataView()
    }
}
