//
//  PrincipalViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PrincipalViewList: View {
    @EnvironmentObject var pocom: PocomStore
    @State private var searchQuery: String = ""
    @State private var queryString: String = ""
    @State private var searchBool: Bool = false
    
    var body: some View {
        VStack {
            TextField("search", text: self.$searchQuery, onCommit: {self.searchBool = true; self.queryString = self.searchQuery})
            if searchBool == true {
                PrincipalViewSearchList(search: $queryString)
            }
            else
            {
                PrincipalViewNoSearchList()
            }
        }
        .navigationBarTitle("Principal  Officer Roles")
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading:
//            NavigationLink(destination: ContentView()) {
//                Text("Back Home")
//        })
    }
}

struct PrincipalViewSearchList: View {
    @Binding var search: String
    
    var body: some View {
        
        List {
            ForEach(XmlPrincipalOfficerRole.allCases.filter {
                $0.getPORoleName().lowercased().contains(self.search.lowercased())
                },
                    id: \.self.id) { XmlPrincipalOfficerRole in
                        PrincipalViewRow(role: XmlPrincipalOfficerRole)
            }
        }
    }
}

struct PrincipalViewNoSearchList: View {
    
    var body: some View {
        List(XmlPrincipalOfficerRole.allCases) { XmlPrincipalOfficerRole in
                PrincipalViewRow(role: XmlPrincipalOfficerRole)
        }
    }
}

//struct PrincipalViewList_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewList()
//    }
//}
