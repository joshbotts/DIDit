//
//  ChiefViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct CountryWithoutChiefViewList: View {
    @EnvironmentObject var pocom: PocomStore
    var countriesWithoutChiefs: [XmlCountry] {
        var countriesWithoutChiefs: [XmlCountry] = []
        for country in XmlCountry.allCases {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsWhoServed = chiefsForCountry.filter { $0.startDate != nil || $0.chargeDate != nil || $0.credentialDate != nil }
            chiefsWhoServed.sort { $0.sortDate() > $1.sortDate() }
            if !chiefsWhoServed.isEmpty {
            let lastChief = chiefsWhoServed.first!
            if lastChief.endDate != nil {
                if lastChief.endDate! < Date(timeIntervalSinceNow: -31536000) {
                countriesWithoutChiefs.append(country)
            }
            }
        }
        }
        var existingCountriesWithoutChiefs = countriesWithoutChiefs.filter { $0 != XmlCountry.czechoslovakia }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.germanDemocraticRepublic }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.hawaii }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.texas }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.twoSicilies }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.vietnamSouth }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.yugoslavia }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.unid }
        existingCountriesWithoutChiefs = existingCountriesWithoutChiefs.filter { $0 != XmlCountry.usoa }
            return existingCountriesWithoutChiefs
    }
    
//    @State private var searchQuery: String = ""
//    @State private var queryString: String = ""
//    @State private var searchBool: Bool = false
    
    var body: some View {
        List(countriesWithoutChiefs) { XmlCountry in
            CountryWithoutChiefViewRow(country: XmlCountry)
        }
    }
}

//struct CountryWithoutChiefViewSearchList: View {
//    @Binding var search: String
//    @EnvironmentObject var pocom: PocomStore
//
//    var body: some View {
//
//        List {
//            ForEach(XmlCountry.allCases.filter {
//                $0.rawValue.contains(self.search.lowercased())
//                },
//                    id: \.self.id) { XmlCountry in
//                        ChiefViewRow(country: XmlCountry)
//            }
//        }
//    }
//}
//
//struct CountryWithoutChiefViewNoSearchList: View {
//    @EnvironmentObject var pocom: PocomStore
//
//    var body: some View {
//        List(XmlCountry.allCases) { XmlCountry in
//            ChiefViewRow(country: XmlCountry)
//        }
//    }
//}

//struct PrincipalViewList_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewList()
//    }
//}
