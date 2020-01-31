//
//  LastAmbassadorForCountry.swift
//  DIDit
//
//  Created by Joshua Botts on 1/31/20.
//  Copyright © 2020 Joshua Botts. All rights reserved.
//

import SwiftUI

struct LastAmbassadorForCountry: View {
    @EnvironmentObject var pocom: PocomStore
    var existingCountries: [XmlCountry] {
        var countries = XmlCountry.allCases
        countries = countries.filter { $0 != XmlCountry.czechoslovakia }
        countries = countries.filter { $0 != XmlCountry.germanDemocraticRepublic }
        countries = countries.filter { $0 != XmlCountry.hawaii }
        countries = countries.filter { $0 != XmlCountry.texas }
        countries = countries.filter { $0 != XmlCountry.twoSicilies }
        countries = countries.filter { $0 != XmlCountry.vietnamSouth }
        countries = countries.filter { $0 != XmlCountry.yugoslavia }
        countries = countries.filter { $0 != XmlCountry.unid }
        countries = countries.filter { $0 != XmlCountry.usoa }
        countries = countries.filter { $0 != XmlCountry.asean }
        countries = countries.filter { $0 != XmlCountry.au }
        countries = countries.filter { $0 != XmlCountry.eu }
        countries = countries.filter { $0 != XmlCountry.iaea }
        countries = countries.filter { $0 != XmlCountry.icao }
        countries = countries.filter { $0 != XmlCountry.nato }
        countries = countries.filter { $0 != XmlCountry.oas }
        countries = countries.filter { $0 != XmlCountry.oecd }
        countries = countries.filter { $0 != XmlCountry.osce }
        countries = countries.filter { $0 != XmlCountry.un }
        countries = countries.filter { $0 != XmlCountry.unaf }
        countries = countries.filter { $0 != XmlCountry.unes }
        countries = countries.filter { $0 != XmlCountry.uneo }
        countries = countries.filter { $0 != XmlCountry.unvo }
        return countries
    }
    var lastAmbassadors: [PocomInstance] {
        var lastAmbassadors: [PocomInstance] = []
        for country in existingCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            let chiefsWhoServed = chiefsForCountry.filter { $0.startDate != nil || $0.chargeDate != nil || $0.credentialDate != nil }
            var ambassadors = chiefsWhoServed.filter { $0.comRole == XmlCOMRole.ambassadorEP }
            ambassadors.sort { $0.sortDate() > $1.sortDate() }
            if !ambassadors.isEmpty {
                let lastAmbassador = ambassadors.first!
                pocom.associatePerson(instance: lastAmbassador)
                lastAmbassadors.append(lastAmbassador)
            }
        }
        
        return lastAmbassadors
    }
    
    var body: some View {
        VStack {
            Button("Copy csv data to clipboard") {
            var exportedList: [String] = []
            for lastAmbassador in self.lastAmbassadors {
                var export = lastAmbassador.country!.getCountryName() + ";" + lastAmbassador.person!.getDisplayName() + ";"
                if lastAmbassador.endDate == nil {
                    export += "Currently Serving"
                    
                } else {
                    export += lastAmbassador.endDateString()
                }
                exportedList.append(export)
            }
            UIPasteboard.general.string = exportedList.joined(separator: "\n")
        }
        List(lastAmbassadors) { lastAmbassador in
            VStack(alignment: .leading) {
                Text(lastAmbassador.country!.getCountryName())
                HStack {
                    Text("Last Ambassador:")
                    Text(lastAmbassador.person!.getDisplayName())
                }
                HStack {
                    Text("Relinquished charge:")
                    Text(lastAmbassador.endDate == nil ? "Currently Serving" : lastAmbassador.endDateString())
                }
            }
        }
        }
    }
}

struct LastAmbassadorForCountry_Previews: PreviewProvider {
    static var previews: some View {
        LastAmbassadorForCountry()
    }
}
