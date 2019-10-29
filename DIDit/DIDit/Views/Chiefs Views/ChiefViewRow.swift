//
//  ChiefViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/8/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct ChiefViewRow: View {
    @EnvironmentObject var pocom: PocomStore
    var country: XmlCountry
    var body: some View {
        NavigationLink(destination: ChiefRoleViewList(country: country)) {
            VStack(alignment: .leading) {
            Text(country.getCountryName())
            }
    }
}
}


//struct PrincipalViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewRow()
//    }
//}
