//
//  AFRequest.swift
//  DIDit
//
//  Created by Joshua Botts on 12/12/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct HWBushAndClintonPOCOM: View {
    @EnvironmentObject var pocom: PocomStore

    let bushTenure = Date("1989-01-20")...Date("1993-01-20")
    let clintonTenure = Date("1993-01-20")...Date("2001-01-20")
    
    var bushChiefs: [PocomInstance] {
        var chiefs = pocom.chiefs.filter { bushTenure.contains($0.startDate ?? Date()) || bushTenure.contains($0.chargeDate ?? Date()) || bushTenure.contains($0.credentialDate ?? Date()) || bushTenure.contains($0.endDate ?? Date()) }
        chiefs.sort { $0.sortDate() > $1.sortDate() }
        for chief in chiefs {
            pocom.associatePerson(instance: chief)
            }
        return chiefs
    }
    
    var bushChiefsExport: [String] {
        var csv: [String] = ["-----Chiefs of Mission During the HW Bush Administration-----"]
        for chief in bushChiefs {
            pocom.associatePerson(instance: chief)
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var bushPrincipals: [PocomInstance] {
        var principals = pocom.principals.filter { bushTenure.contains($0.startDate ?? Date()) || bushTenure.contains($0.dutyDate ?? Date()) || bushTenure.contains($0.endDate ?? Date()) }
        principals.sort { $0.sortDate() > $1.sortDate() }
        for principal in principals {
        pocom.associatePerson(instance: principal)
        }
        return principals
    }
    
    var bushPrincipalsExport: [String] {
        var csv: [String] = ["-----Principal Officers During the HW Bush Administration-----"]
        for principal in bushPrincipals {
            pocom.associatePerson(instance: principal)
            csv.append(principal.exportPrincipalSCSV())
        }
        return csv
    }
    
    var clintonChiefs: [PocomInstance] {
        var chiefs = pocom.chiefs.filter { clintonTenure.contains($0.startDate ?? Date()) || clintonTenure.contains($0.chargeDate ?? Date()) || clintonTenure.contains($0.credentialDate ?? Date()) || clintonTenure.contains($0.endDate ?? Date()) }
        chiefs.sort { $0.sortDate() > $1.sortDate() }
        for chief in chiefs {
        pocom.associatePerson(instance: chief)
        }
        return chiefs
    }
    
    var clintonChiefsExport: [String] {
        var csv: [String] = ["-----Chiefs of Mission During the Clinton Administration-----"]
        for chief in clintonChiefs {
            pocom.associatePerson(instance: chief)
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var clintonPrincipals: [PocomInstance] {
        var principals = pocom.principals.filter { clintonTenure.contains($0.startDate ?? Date()) || clintonTenure.contains($0.dutyDate ?? Date()) || clintonTenure.contains($0.endDate ?? Date()) }
        principals.sort { $0.sortDate() > $1.sortDate() }
        for principal in principals {
        pocom.associatePerson(instance: principal)
        }
        return principals
    }
    
    var clintonPrincipalsExport: [String] {
        var csv: [String] = ["-----Principal Officers During the Clinton Administration-----"]
        for principal in clintonPrincipals {
            pocom.associatePerson(instance: principal)
            csv.append(principal.exportPrincipalSCSV())
        }
        return csv
    }
    
    var bushAndClintonPOCOM: [PocomInstance] {
        return bushChiefs + bushPrincipals + clintonChiefs + clintonPrincipals
    }
    

    var body: some View {
        VStack {
            Button("Copy csv data to clipboard") {
                let exportedElements = self.bushChiefsExport + self.bushPrincipalsExport + self.clintonChiefsExport + self.clintonPrincipalsExport
                UIPasteboard.general.string = exportedElements.joined(separator: "\n")
            }
        List(bushAndClintonPOCOM) { instance in
            VStack(alignment: .leading) {
                Text(instance.person!.getDisplayName())
                Text(instance.instanceRole())
                HStack {
                    Text(instance.startDateString())
                    Text(instance.endDateString())
                }
            }
        }
        }
    }
}

struct HWBushAndClintonPOCOM_Previews: PreviewProvider {
    static var previews: some View {
        AFRequest()
    }
}
