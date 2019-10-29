//
//  CountryWithoutChiefViewRow.swift
//  DIDit
//
//  Created by Joshua Botts on 10/29/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct CountryWithoutChiefViewRow: View {
    @EnvironmentObject var pocom: PocomStore
    var country: XmlCountry
    var lastChief: PocomInstance {
        let chiefsForCountry = pocom.instancesForCountry(country: country)
        var chiefsWhoServed = chiefsForCountry.filter { $0.startDate != nil || $0.chargeDate != nil || $0.credentialDate != nil }
        chiefsWhoServed.sort { $0.sortDate() > $1.sortDate() }
        let lastChief = chiefsWhoServed.first!
        pocom.associatePerson(instance: lastChief)
        return lastChief
    }
    var endDateString: String {
    let didDateFormatter = DateFormatter()
    didDateFormatter.locale = Locale(identifier: "en_US")
    didDateFormatter.dateFormat = "yyyy-MM-dd"
        return didDateFormatter.string(from: lastChief.endDate!)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(country.getCountryName())
            HStack {
                Text("Last chief of mission:")
                Text(lastChief.person!.lastName)
            }
            HStack {
                Text("Relinquished charge:")
                Text(endDateString)
            }
        }
    }
}

//struct CountryWithoutChiefViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryWithoutChiefViewRow()
//    }
//}
