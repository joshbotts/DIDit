//
//  CountryWithoutChiefViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct CountryWithoutChiefViewList: View {
    @EnvironmentObject var pocom: PocomStore
    //    var countriesWithoutChiefs: [XmlCountry] {
    //        var countriesWithoutChiefs: [XmlCountry] = []
    //        for country in XmlCountry.allCases {
    //            let chiefsForCountry = pocom.instancesForCountry(country: country)
    //            var chiefsWhoServed = chiefsForCountry.filter { $0.startDate != nil || $0.chargeDate != nil || $0.credentialDate != nil }
    //            chiefsWhoServed.sort { $0.sortDate() > $1.sortDate() }
    //            if !chiefsWhoServed.isEmpty {
    //            let lastChief = chiefsWhoServed.first!
    //            if lastChief.endDate != nil {
    //                if lastChief.endDate! < Date(timeIntervalSinceNow: -31536000) {
    //                countriesWithoutChiefs.append(country)
    //            }
    //            }
    //        }
    //        }
    //        var existingCountriesWithoutChiefs = countriesWithoutChiefs.filter { $0 != XmlCountry.czechoslovakia }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.germanDemocraticRepublic }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.hawaii }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.texas }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.twoSicilies }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.vietnamSouth }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.yugoslavia }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.unid }
    //        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.usoa }
    //            return existingCountriesWithoutChiefs
    //    }
    var lastChiefs: [PocomInstance] {
        var lastChiefs: [PocomInstance] = []
        for country in XmlCountry.allCases {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsWhoServed = chiefsForCountry.filter { $0.startDate != nil || $0.chargeDate != nil || $0.credentialDate != nil }
            chiefsWhoServed.sort { $0.sortDate() > $1.sortDate() }
            if !chiefsWhoServed.isEmpty {
                let lastChief = chiefsWhoServed.first!
                if lastChief.endDate != nil {
                    if lastChief.endDate! < Date(timeIntervalSinceNow: -31536000) {
                        pocom.associatePerson(instance: lastChief)
                        lastChiefs.append(lastChief)
                    }
                }
            }
        }
        var chiefsOfExistingCountries = lastChiefs.filter { $0.country! != XmlCountry.czechoslovakia }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.germanDemocraticRepublic }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.hawaii }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.texas }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.twoSicilies }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.vietnamSouth }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.yugoslavia }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.unid }
        chiefsOfExistingCountries = chiefsOfExistingCountries.filter { $0.country! != XmlCountry.usoa }
        return chiefsOfExistingCountries
    }
    
    //    @State private var searchQuery: String = ""
    //    @State private var queryString: String = ""
    //    @State private var searchBool: Bool = false
    
    var body: some View {
        List(lastChiefs) { lastChief in
            VStack(alignment: .leading) {
                Text(lastChief.country!.getCountryName())
                HStack {
                    Text("Last chief of mission:")
                    Text(lastChief.person!.lastName)
                }
                HStack {
                    Text("Relinquished charge:")
                    Text(lastChief.endDateString())
                }
            }
        }
        .navigationBarTitle("Countries where last COM left over a year ago")
    }
}

//struct PrincipalViewList_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewList()
//    }
//}
