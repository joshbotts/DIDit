//
//  PrincipalRoleViewList.swift
//  DID IT
//
//  Created by Joshua Botts on 10/6/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PrincipalRoleViewList: View {
    @EnvironmentObject var pocom: PocomStore
    var role: XmlPrincipalOfficerRole
    
    var principalsForRole: [PocomInstance] {
        var principals = pocom.instancesForRole(role: role)
        for principal in principals {
            if principal.person == nil {
                pocom.associatePerson(instance: principal)
            }
        }
        principals.sort { $0.sortDate() < $1.sortDate() }
        return principals
    }
    
    
    var body: some View {
        List(principalsForRole) { principal in
            PrincipalRoleViewRow(principal: principal)
        }
        .navigationBarTitle("\(role.getPORoleName())")
        // make a dictionary of PO role pluralizations to use here
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
