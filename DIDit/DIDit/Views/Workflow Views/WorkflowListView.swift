//
//  WorkflowListView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/28/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct WorkflowListView: View {
    @EnvironmentObject var pocom: PocomStore
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
                    Text("People without identified sex")
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
            NavigationLink(destination: ChiefsWithoutCredentialsView()) {
                HStack {
                    Image(systemName: "briefcase.fill")
                    Text("Chiefs of Mission without a credentials date")
                        .font(.headline)
                }
            }
            NavigationLink(destination: AFRequest()) {
                HStack {
                    Image(systemName: "printer.fill")
                    Text("Chiefs of Mission and Charges, by Regional Bureau, Since 2000 (for Aaron)")
                        .font(.headline)
                }
            }
            NavigationLink(destination: ChargesConvertCredentialDateToChargeDate()) {
                HStack {
                    Image(systemName: "wand.and.rays")
                    Text("Convert credentialing dates to charge dates for chargés")
                        .font(.headline)
                }
            }
        }
    .navigationBarTitle("DID Team Action Items")
    }
}

struct WorkflowListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowListView()
    }
}
