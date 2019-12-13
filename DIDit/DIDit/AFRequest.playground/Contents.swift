import UIKit

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

var afChiefsSince2000: [PocomInstance] {
    var afChiefs: [PocomInstance] = []
    for country in afCountries {
        let chiefsForCountry = pocom.instancesForCountry(country: country)
        var chiefsSince2000 = chiefsForCountry.filter { $0.startDate > Date("2000-01-01") || $0.chargeDate > Date("2000-01-01") || $0.credentialDate > Date("2000-01-01") || $0.endDate > Date("2000-01-01") }
        chiefsSince2000.sort { $0.sortDate() > $1.sortDate() }
        afChiefs.append(chiefsSince2000)
    }
    return afChiefs
}

var afChargesSince2000 = afChiefsSince2000.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }

var worldChargesSince2000: [PocomInstance] {
    var chargesSince2000: [PocomInstance] = []
    for country in XmlCountry.allCases {
        let chiefsForCountry = pocom.instancesForCountry(country: country)
        var chargesForCountry = chiefsForCountry.filter { $0.comRole == XmlCOMRole.chargeDaffaires || $0.comRole == XmlCOMRole.chargeDaffairesAdInterim }
        var chargesForCountrySince2000 = chargesForCountry.filter { $0.startDate > Date("2000-01-01") || $0.chargeDate > Date("2000-01-01") || $0.credentialDate > Date("2000-01-01") || $0.endDate > Date("2000-01-01") }
        chargesSince2000.sort { $0.sortDate() > $1.sortDate() }
        chargesSince2000.append(chargesForCountrySince2000)
    }
    return chargesSince2000
}
