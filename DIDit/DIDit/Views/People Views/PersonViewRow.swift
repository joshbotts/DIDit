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
                .contextMenu {
                Button(action:
                {
                    self.pocom.deletePerson(person: self.person)
                })
                {
                    Text("Delete Person")
                    Image(systemName: "trash.fill")
                    
                }
                Button(action:
                {
                    UIPasteboard.general.string = self.person.exportPersonElement()
                })
                {
                    Text("Copy Person XML Element")
                    Image(systemName: "doc.on.doc.fill")
                }
                Button(action:
                {
                    UIPasteboard.general.string = self.person.exportPersonJson()
                })
                {
                    Text("Copy Person JSON Data")
                    Image(systemName: "doc.on.doc")
                }
                }
            }
    }
}

//struct PersonViewRow_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonViewRow()
//    }
//}
