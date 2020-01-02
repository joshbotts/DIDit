//
//  PersonViewRow.swift
//  DID IT
//
//  Created by Joshua Botts on 10/3/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct PersonViewRow: View {
    @EnvironmentObject var pocom: PocomStore
    var person: PocomPerson
    
    var body: some View {
            HStack {
                Text(person.getDisplayName())
                .bold()
            }
    }
}

//struct PersonViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonViewRow()
//    }
//}
