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
                    Text("Chiefs of Mission and Charges, by Regional Bureau, Since 2000")
                        .font(.headline)
                }
            }
            NavigationLink(destination: LastAmbassadorForCountry()) {
                HStack {
                    Image(systemName: "printer.fill")
                    Text("Last Ambassadors for Currently Existing Countries")
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
            NavigationLink(destination: HWBushAndClintonPOCOM()) {
                HStack {
                    Image(systemName: "printer.fill")
                    Text("POCOM Officials During the HW Bush and Clinton Administrations")
                        .font(.headline)
                }
            }
            NavigationLink(destination: CSVExportAll()) {
                HStack {
                    Image(systemName: "printer.fill")
                    Text("Export SCSV For POCOM")
                        .font(.headline)
                }
            }
        }
    .navigationBarTitle("DID Actions")
    }
}

struct WorkflowListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowListView()
    }
}
