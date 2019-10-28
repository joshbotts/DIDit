//
//  ChiefViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct CountryWithoutChiefViewList: View {
//    @State private var searchQuery: String = ""
//    @State private var queryString: String = ""
//    @State private var searchBool: Bool = false
    
    var body: some View {
        VStack {
            Text("In progress.")
//            TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
//            if searchBool == true {
//                CountryWithoutChiefViewSearchList(search: $queryString)
//            }
//            else
//            {
//                CountryWithoutChiefViewNoSearchList()
//            }
        }
//        .navigationBarTitle("Countries and Organizations")
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
