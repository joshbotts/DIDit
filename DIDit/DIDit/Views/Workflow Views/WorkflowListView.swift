//
//  WorkflowListView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/28/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct WorkflowListView: View {
    var body: some View {
        List {
            NavigationLink(destination: AddedDataView()) {
                HStack {
                    Image(systemName: "square.and.arrow.up.on.square.fill")
                    Text("View/export data entered with app")
                        .font(.headline)
                }
            }
            NavigationLink(destination: PersonWithoutBirthYearViewList()) {
                HStack {
                    Image(systemName: "calendar.badge.plus")
                    Text("People missing birth years")
                        .font(.headline)
                }
            }
            NavigationLink(destination: PersonWithoutBirthYearViewList()) {
                HStack {
                    Image(systemName: "calendar.badge.minus")
                    Text("People missing death years")
                        .font(.headline)
                }
            }
            NavigationLink(destination: PersonWithoutSexViewList()) {
                HStack {
                    Image(systemName: "person.crop.circle.fill.badge.exclam")
                    Text("People missing sex")
                        .font(.headline)
                }
            }
            NavigationLink(destination: CountryWithoutChiefViewList()) {
                HStack {
                    Image(systemName: "briefcase.fill")
                    Text("Countries without a COM for longer than 12 months")
                        .font(.headline)
                }
            }
        }
    }
}

struct WorkflowListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowListView()
    }
}
