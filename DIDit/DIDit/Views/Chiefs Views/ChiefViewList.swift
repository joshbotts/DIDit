//
//  ChiefViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChiefViewList: View {
    @EnvironmentObject var pocom: PocomStore
    @State private var searchQuery: String = ""
    @State private var queryString: String = ""
    @State private var searchBool: Bool = false
    
    var body: some View {
        VStack {
            TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
            if searchBool == true {
                ChiefViewSearchList(search: $queryString)
            }
            else
            {
                ChiefViewNoSearchList()
            }
        }
        .navigationBarTitle("Countries and Organizations")
    }
}

struct ChiefViewSearchList: View {
    @Binding var search: String
    
    var body: some View {
        
        List {
            ForEach(XmlCountry.allCases.filter {
                $0.rawValue.contains(self.search.lowercased())
                },
                    id: \.self.id) { XmlCountry in
                        ChiefViewRow(country: XmlCountry)
            }
        }
    }
}

struct ChiefViewNoSearchList: View {
    
    var body: some View {
        List(XmlCountry.allCases) { XmlCountry in
            ChiefViewRow(country: XmlCountry)
        }
    }
}

//struct PrincipalViewList_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewList()
//    }
//}
