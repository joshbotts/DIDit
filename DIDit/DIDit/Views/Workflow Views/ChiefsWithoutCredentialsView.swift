//
//  ChiefsWithoutCredentialsView.swift
//  DIDit
//
//  Created by Joshua Botts on 10/29/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChiefsWithoutCredentialsView: View {
    @EnvironmentObject var pocom: PocomStore
    var chiefsWithoutCredentials: [PocomInstance] {
        var chiefs: [PocomInstance] = []
        for chief in pocom.chiefs {
            if (chief.startDate != nil || chief.chargeDate != nil) && chief.credentialDate == nil {
                chiefs.append(chief)
            }
        }
        chiefs.sort { $0.sortDate() > $1.sortDate() }
        return chiefs
    }
    
    var body: some View {
        List {
            ForEach(chiefsWithoutCredentials) { chief in
                ChiefRoleViewRow(chief: chief)
            }
        }
    .navigationBarTitle("Chiefs without credential dates")
    }
}

struct ChiefsWithoutCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        ChiefsWithoutCredentialsView()
    }
}
