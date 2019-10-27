//
//  PrincipalViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/8/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PrincipalViewRow: View {
    var role: XmlPrincipalOfficerRole
    var body: some View {
        NavigationLink(destination: PrincipalRoleViewList(role: role)) {
            VStack(alignment: .leading) {
            Text(role.getPORoleName())
            }
    }
}
}


//struct PrincipalViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PrincipalViewRow()
//    }
//}
