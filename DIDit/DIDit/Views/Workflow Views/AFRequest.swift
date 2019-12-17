//
//  AFRequest.swift
//  DIDit
//
//  Created by Joshua Botts on 12/12/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import SwiftUI

struct AFRequest: View {
    @EnvironmentObject var pocom: PocomStore
    var afCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.angola)
        countries.append(XmlCountry.benin)
        countries.append(XmlCountry.botswana)
        countries.append(XmlCountry.burkinaFaso)
        countries.append(XmlCountry.burundi)
        countries.append(XmlCountry.capeVerde)
        countries.append(XmlCountry.cameroon)
        countries.append(XmlCountry.centralAfricanRepublic)
        countries.append(XmlCountry.chad)
        countries.append(XmlCountry.comoros)
        countries.append(XmlCountry.coteDivoire)
        countries.append(XmlCountry.congoBrazzaville)
        countries.append(XmlCountry.congoKinshasa)
        countries.append(XmlCountry.djibouti)
        countries.append(XmlCountry.equatorialGuinea)
        countries.append(XmlCountry.eritrea)
        countries.append(XmlCountry.swaziland)
        countries.append(XmlCountry.ethiopia)
        countries.append(XmlCountry.gabon)
        countries.append(XmlCountry.gambia)
        countries.append(XmlCountry.ghana)
        countries.append(XmlCountry.guinea)
        countries.append(XmlCountry.guineaBissau)
        countries.append(XmlCountry.kenya)
        countries.append(XmlCountry.lesotho)
        countries.append(XmlCountry.liberia)
        countries.append(XmlCountry.madagascar)
        countries.append(XmlCountry.malawi)
        countries.append(XmlCountry.mali)
        countries.append(XmlCountry.mauritania)
        countries.append(XmlCountry.mauritius)
        countries.append(XmlCountry.mozambique)
        countries.append(XmlCountry.namibia)
        countries.append(XmlCountry.niger)
        countries.append(XmlCountry.nigeria)
        countries.append(XmlCountry.rwanda)
        countries.append(XmlCountry.saoTomeAndPrincipe)
        countries.append(XmlCountry.senegal)
        countries.append(XmlCountry.seychelles)
        countries.append(XmlCountry.sierraLeone)
        countries.append(XmlCountry.somalia)
        countries.append(XmlCountry.southAfrica)
        countries.append(XmlCountry.southSudan)
        countries.append(XmlCountry.sudan)
        countries.append(XmlCountry.tanzania)
        countries.append(XmlCountry.togo)
        countries.append(XmlCountry.uganda)
        countries.append(XmlCountry.zambia)
        countries.append(XmlCountry.zimbabwe)
        return countries
    }
    
    var eurCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.albania)
        countries.append(XmlCountry.andorra)
        countries.append(XmlCountry.armenia)
        countries.append(XmlCountry.austria)
        countries.append(XmlCountry.azerbaijan)
        countries.append(XmlCountry.belarus)
        countries.append(XmlCountry.belgium)
        countries.append(XmlCountry.bosniaHerzegovina)
        countries.append(XmlCountry.bulgaria)
        countries.append(XmlCountry.croatia)
        countries.append(XmlCountry.cyprus)
        countries.append(XmlCountry.czechRepublic)
        countries.append(XmlCountry.denmark)
        countries.append(XmlCountry.estonia)
        countries.append(XmlCountry.finland)
        countries.append(XmlCountry.france)
        countries.append(XmlCountry.georgia)
        countries.append(XmlCountry.germany)
        countries.append(XmlCountry.greece)
        countries.append(XmlCountry.holySee)
        countries.append(XmlCountry.hungary)
        countries.append(XmlCountry.iceland)
        countries.append(XmlCountry.ireland)
        countries.append(XmlCountry.italy)
        countries.append(XmlCountry.kosovo)
        countries.append(XmlCountry.latvia)
        countries.append(XmlCountry.liechtenstein)
        countries.append(XmlCountry.lithuania)
        countries.append(XmlCountry.luxembourg)
        countries.append(XmlCountry.malta)
        countries.append(XmlCountry.moldova)
        countries.append(XmlCountry.monaco)
        countries.append(XmlCountry.montenegro)
        countries.append(XmlCountry.netherlands)
        countries.append(XmlCountry.macedonia)
        countries.append(XmlCountry.norway)
        countries.append(XmlCountry.poland)
        countries.append(XmlCountry.portugal)
        countries.append(XmlCountry.romania)
        countries.append(XmlCountry.russia)
        countries.append(XmlCountry.sanMarino)
        countries.append(XmlCountry.serbia)
        countries.append(XmlCountry.slovakia)
        countries.append(XmlCountry.slovenia)
        countries.append(XmlCountry.spain)
        countries.append(XmlCountry.sweden)
        countries.append(XmlCountry.switzerland)
        countries.append(XmlCountry.turkey)
        countries.append(XmlCountry.ukraine)
        countries.append(XmlCountry.unitedKingdom)
        return countries
    }
    
    var eapCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.australia)
        countries.append(XmlCountry.brunei)
        countries.append(XmlCountry.burma)
        countries.append(XmlCountry.cambodia)
        countries.append(XmlCountry.china)
        countries.append(XmlCountry.fiji)
        countries.append(XmlCountry.indonesia)
        countries.append(XmlCountry.japan)
        countries.append(XmlCountry.kiribati)
        countries.append(XmlCountry.laos)
        countries.append(XmlCountry.malaysia)
        countries.append(XmlCountry.marshallIslands)
        countries.append(XmlCountry.micronesia)
        countries.append(XmlCountry.mongolia)
        countries.append(XmlCountry.nauru)
        countries.append(XmlCountry.newZealand)
        countries.append(XmlCountry.korea)
        countries.append(XmlCountry.palau)
        countries.append(XmlCountry.papuaNewGuinea)
        countries.append(XmlCountry.philippines)
        countries.append(XmlCountry.samoa)
        countries.append(XmlCountry.singapore)
        countries.append(XmlCountry.solomonIslands)
        countries.append(XmlCountry.thailand)
        countries.append(XmlCountry.timorLeste)
        countries.append(XmlCountry.tonga)
        countries.append(XmlCountry.tuvalu)
        countries.append(XmlCountry.vanuatu)
        countries.append(XmlCountry.vietnam)
        return countries
    }
    
    var neaCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.algeria)
        countries.append(XmlCountry.bahrain)
        countries.append(XmlCountry.egypt)
        countries.append(XmlCountry.iran)
        countries.append(XmlCountry.iraq)
        countries.append(XmlCountry.israel)
        countries.append(XmlCountry.jordan)
        countries.append(XmlCountry.kuwait)
        countries.append(XmlCountry.lebanon)
        countries.append(XmlCountry.libya)
        countries.append(XmlCountry.morocco)
        countries.append(XmlCountry.oman)
        countries.append(XmlCountry.qatar)
        countries.append(XmlCountry.saudiArabia)
        countries.append(XmlCountry.syria)
        countries.append(XmlCountry.tunisia)
        countries.append(XmlCountry.unitedArabEmirates)
        countries.append(XmlCountry.yemen)
        return countries
    }
    
    var scaCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.afghanistan)
        countries.append(XmlCountry.bangladesh)
        countries.append(XmlCountry.india)
        countries.append(XmlCountry.kazakhstan)
        countries.append(XmlCountry.kyrgyzstan)
        countries.append(XmlCountry.maldives)
        countries.append(XmlCountry.nepal)
        countries.append(XmlCountry.pakistan)
        countries.append(XmlCountry.sriLanka)
        countries.append(XmlCountry.tajikistan)
        countries.append(XmlCountry.turkmenistan)
        countries.append(XmlCountry.uzbekistan)
        return countries
    }
    
    var whaCountries: [XmlCountry] {
        var countries: [XmlCountry] = []
        countries.append(XmlCountry.antiguaAndBarbuda)
        countries.append(XmlCountry.argentina)
        countries.append(XmlCountry.bahamas)
        countries.append(XmlCountry.barbados)
        countries.append(XmlCountry.belize)
        countries.append(XmlCountry.bolivia)
        countries.append(XmlCountry.brazil)
        countries.append(XmlCountry.canada)
        countries.append(XmlCountry.chile)
        countries.append(XmlCountry.colombia)
        countries.append(XmlCountry.costaRica)
        countries.append(XmlCountry.cuba)
        countries.append(XmlCountry.dominica)
        countries.append(XmlCountry.dominicanRepublic)
        countries.append(XmlCountry.ecuador)
        countries.append(XmlCountry.elSalvador)
        countries.append(XmlCountry.grenada)
        countries.append(XmlCountry.guatemala)
        countries.append(XmlCountry.guyana)
        countries.append(XmlCountry.haiti)
        countries.append(XmlCountry.honduras)
        countries.append(XmlCountry.jamaica)
        countries.append(XmlCountry.mexico)
        countries.append(XmlCountry.nicaragua)
        countries.append(XmlCountry.panama)
        countries.append(XmlCountry.paraguay)
        countries.append(XmlCountry.peru)
        countries.append(XmlCountry.saintKittsAndNevis)
        countries.append(XmlCountry.saintLucia)
        countries.append(XmlCountry.saintVincentAndGrenadines)
        countries.append(XmlCountry.suriname)
        countries.append(XmlCountry.trinidadAndTobago)
        countries.append(XmlCountry.uruguay)
        countries.append(XmlCountry.venezuela)
        return countries
    }

    var afChiefsSince2000: [PocomInstance] {
        var afChiefs: [PocomInstance] = []
        for country in afCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            afChiefs += chiefsSince2000
        }
        return afChiefs
    }
    
    var afChiefsSince2000Export: [String] {
        var csv: [String] = ["-----AF Chiefs of Mission Since 2000-----"]
        for chief in afChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var eapChiefsSince2000: [PocomInstance] {
        var eapChiefs: [PocomInstance] = []
        for country in eapCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            eapChiefs += chiefsSince2000
        }
        return eapChiefs
    }
    
    var eapChiefsSince2000Export: [String] {
        var csv: [String] = ["-----EAP Chiefs of Mission Since 2000-----"]
        for chief in eapChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var eurChiefsSince2000: [PocomInstance] {
        var eurChiefs: [PocomInstance] = []
        for country in eurCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            eurChiefs += chiefsSince2000
        }
        return eurChiefs
    }
    
    var eurChiefsSince2000Export: [String] {
        var csv: [String] = ["-----EUR Chiefs of Mission Since 2000-----"]
        for chief in eurChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var neaChiefsSince2000: [PocomInstance] {
        var neaChiefs: [PocomInstance] = []
        for country in neaCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            neaChiefs += chiefsSince2000
        }
        return neaChiefs
    }
    
    var neaChiefsSince2000Export: [String] {
        var csv: [String] = ["-----NEA Chiefs of Mission Since 2000-----"]
        for chief in neaChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var scaChiefsSince2000: [PocomInstance] {
        var scaChiefs: [PocomInstance] = []
        for country in scaCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            scaChiefs += chiefsSince2000
        }
        return scaChiefs
    }
    
    var scaChiefsSince2000Export: [String] {
        var csv: [String] = ["-----SCA Chiefs of Mission Since 2000-----"]
        for chief in scaChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }
    
    var whaChiefsSince2000: [PocomInstance] {
        var whaChiefs: [PocomInstance] = []
        for country in whaCountries {
            let chiefsForCountry = pocom.instancesForCountry(country: country)
            var chiefsSince2000 = chiefsForCountry.filter { $0.startDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.chargeDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.credentialDate ?? Date("1991-10-28") > Date("2000-01-01") || $0.endDate ?? Date("1991-10-28") > Date("2000-01-01") }
            chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
            whaChiefs += chiefsSince2000
        }
        return whaChiefs
    }
    
    var whaChiefsSince2000Export: [String] {
        var csv: [String] = ["-----WHA Chiefs of Mission Since 2000-----"]
        for chief in whaChiefsSince2000 {
            csv.append(chief.exportChiefSCSV())
        }
        return csv
    }

    var afChargesSince2000: [PocomInstance] {
        let charges = afChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var afChargesSince2000Export: [String] {
        var csv: [String] = ["-----AF Charges Since 2000-----"]
        for charge in afChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }
    
    var eapChargesSince2000: [PocomInstance] {
        let charges = eapChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var eapChargesSince2000Export: [String] {
        var csv: [String] = ["-----EAP Charges Since 2000-----"]
        for charge in eapChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }
    
    var eurChargesSince2000: [PocomInstance] {
        let charges = eurChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var eurChargesSince2000Export: [String] {
        var csv: [String] = ["-----EUR Charges Since 2000-----"]
        for charge in eurChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }
    
    var neaChargesSince2000: [PocomInstance] {
        let charges = neaChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var neaChargesSince2000Export: [String] {
        var csv: [String] = ["-----NEA Charges Since 2000-----"]
        for charge in neaChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }
    
    var scaChargesSince2000: [PocomInstance] {
        let charges = scaChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var scaChargesSince2000Export: [String] {
        var csv: [String] = ["-----SCA Charges Since 2000-----"]
        for charge in scaChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }
    
    var whaChargesSince2000: [PocomInstance] {
        let charges = whaChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        return charges
    }
    
    var whaChargesSince2000Export: [String] {
        var csv: [String] = ["-----WHA Charges Since 2000-----"]
        for charge in whaChargesSince2000 {
            csv.append(charge.exportChiefSCSV())
        }
        return csv
    }

    var body: some View {
        HStack {
        Button("Copy csv data to clipboard") {
            let exportedElements = self.afChiefsSince2000Export + self.afChargesSince2000Export + self.eapChiefsSince2000Export + self.eapChargesSince2000Export + self.eurChiefsSince2000Export +
                self.eurChargesSince2000Export + self.neaChiefsSince2000Export +
                self.neaChargesSince2000Export + self.scaChiefsSince2000Export +
                self.scaChargesSince2000Export + self.whaChiefsSince2000Export +
                self.whaChargesSince2000Export
            UIPasteboard.general.string = exportedElements.joined(separator: "\n")
        }
    }
}
}

struct AFRequest_Previews: PreviewProvider {
    static var previews: some View {
        AFRequest()
    }
}
