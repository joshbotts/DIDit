//
//  XmlCountry.swift
//  DID IT
//
//  Created by Joshua Botts on 9/25/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum XmlCountry: String, Identifiable, Hashable, CaseIterable {
    var id: String {
        return self.rawValue
    }
    
    case afghanistan = "afghanistan"
    case albania = "albania"
    case algeria = "algeria"
    case andorra = "andorra"
    case angola = "angola"
    case antiguaAndBarbuda = "antigua-and-barbuda"
    case argentina = "argentina"
    case armenia = "armenia"
    case australia = "australia"
    case austria = "austria"
    case azerbaijan = "azerbaijan"
    case bahamas = "bahamas"
    case bahrain = "bahrain"
    case bangladesh = "bangladesh"
    case barbados = "barbados"
    case belarus = "belarus"
    case belgium = "belgium"
    case belize = "belize"
    case benin = "benin"
    case bolivia = "bolivia"
    case bosniaHerzegovina = "bosnia-herzegovina"
    case botswana = "botswana"
    case brazil = "brazil"
    case brunei = "brunei"
    case bulgaria = "bulgaria"
    case burkinaFaso = "burkina-faso"
    case burma = "burma"
    case burundi = "burundi"
    case capeVerde = "cape-verde"
    case cambodia = "cambodia"
    case cameroon = "cameroon"
    case canada = "canada"
    case centralAfricanRepublic = "central-african-republic"
    case chad = "chad"
    case chile = "chile"
    case china = "china"
    case colombia = "colombia"
    case comoros = "comoros"
    case congoBrazzaville = "congo-brazzaville"
    case congoKinshasa = "congo-kinshasa"
    case costaRica = "costa-rica"
    case coteDivoire = "cote-divoire"
    case croatia = "croatia"
    case cuba = "cuba"
    case cyprus = "cyprus"
    case czechRepublic = "czech-republic"
    case czechoslovakia = "czechoslovakia"
    case denmark = "denmark"
    case djibouti = "djibouti"
    case dominica = "dominica"
    case dominicanRepublic = "dominican-republic"
    case ecuador = "ecuador"
    case egypt = "egypt"
    case elSalvador = "el-salvador"
    case equatorialGuinea = "equatorial-guinea"
    case eritrea = "eritrea"
    case estonia = "estonia"
    case ethiopia = "ethiopia"
    case fiji = "fiji"
    case finland = "finland"
    case france = "france"
    case gabon = "gabon"
    case gambia = "gambia"
    case georgia = "georgia"
    case germanDemocraticRepublic = "german-democratic-republic"
    case germany = "germany"
    case ghana = "ghana"
    case greece = "greece"
    case grenada = "grenada"
    case guatemala = "guatemala"
    case guinea = "guinea"
    case guineaBissau = "guinea-bissau"
    case guyana = "guyana"
    case haiti = "haiti"
    case hawaii = "hawaii"
    case holySee = "holy-see"
    case honduras = "honduras"
    case hungary = "hungary"
    case iceland = "iceland"
    case india = "india"
    case indonesia = "indonesia"
    case iran = "iran"
    case iraq = "iraq"
    case ireland = "ireland"
    case israel = "israel"
    case italy = "italy"
    case jamaica = "jamaica"
    case japan = "japan"
    case jordan = "jordan"
    case kazakhstan = "kazakhstan"
    case kenya = "kenya"
    case kiribati = "kiribati"
    case korea = "korea"
    case kosovo = "kosovo"
    case kuwait = "kuwait"
    case kyrgyzstan = "kyrgyzstan"
    case laos = "laos"
    case latvia = "latvia"
    case lebanon = "lebanon"
    case lesotho = "lesotho"
    case liberia = "liberia"
    case libya = "libya"
    case liechtenstein = "liechtenstein"
    case lithuania = "lithuania"
    case luxembourg = "luxembourg"
    case macedonia = "macedonia"
    case madagascar = "madagascar"
    case malawi = "malawi"
    case malaysia = "malaysia"
    case maldives = "maldives"
    case mali = "mali"
    case malta = "malta"
    case marshallIslands = "marshall-islands"
    case mauritania = "mauritania"
    case mauritius = "mauritius"
    case mexico = "mexico"
    case micronesia = "micronesia"
    case moldova = "moldova"
    case monaco = "monaco"
    case mongolia = "mongolia"
    case montenegro = "montenegro"
    case morocco = "morocco"
    case mozambique = "mozambique"
    case namibia = "namibia"
    case nauru = "nauru"
    case nepal = "nepal"
    case netherlands = "netherlands"
    case newZealand = "new-zealand"
    case nicaragua = "nicaragua"
    case niger = "niger"
    case nigeria = "nigeria"
    case norway = "norway"
    case oman = "oman"
    case pakistan = "pakistan"
    case palau = "palau"
    case panama = "panama"
    case papuaNewGuinea = "papua-new-guinea"
    case paraguay = "paraguay"
    case peru = "peru"
    case philippines = "philippines"
    case poland = "poland"
    case portugal = "portugal"
    case qatar = "qatar"
    case romania = "romania"
    case russia = "russia"
    case rwanda = "rwanda"
    case saintKittsAndNevis = "saint-kitts-and-nevis"
    case saintLucia = "saint-lucia"
    case saintVincentAndGrenadines = "saint-vincent-and-grenadines"
    case samoa = "samoa"
    case sanMarino = "san-marino"
    case saoTomeAndPrincipe = "sao-tome-and-principe"
    case saudiArabia = "saudi-arabia"
    case senegal = "senegal"
    case serbia = "serbia"
    case seychelles = "seychelles"
    case sierraLeone = "sierra-leone"
    case singapore = "singapore"
    case slovakia = "slovakia"
    case slovenia = "slovenia"
    case solomonIslands = "solomon-islands"
    case somalia = "somalia"
    case southAfrica = "south-africa"
    case southSudan = "south-sudan"
    case spain = "spain"
    case sriLanka = "sri-lanka"
    case sudan = "sudan"
    case suriname = "suriname"
    case swaziland = "swaziland"
    case sweden = "sweden"
    case switzerland = "switzerland"
    case syria = "syria"
    case tajikistan = "tajikistan"
    case tanzania = "tanzania"
    case texas = "texas"
    case thailand = "thailand"
    case timorLeste = "timor-leste"
    case togo = "togo"
    case tonga = "tonga"
    case trinidadAndTobago = "trinidad-and-tobago"
    case tunisia = "tunisia"
    case turkey = "turkey"
    case turkmenistan = "turkmenistan"
    case tuvalu = "tuvalu"
    case twoSicilies = "two-sicilies"
    case uganda = "uganda"
    case ukraine = "ukraine"
    case unitedArabEmirates = "united-arab-emirates"
    case unitedKingdom = "united-kingdom"
    case uruguay = "uruguay"
    case uzbekistan = "uzbekistan"
    case vanuatu = "vanuatu"
    case venezuela = "venezuela"
    case vietnam = "vietnam"
    case vietnamSouth = "vietnam-south"
    case yemen = "yemen"
    case yugoslavia = "yugoslavia"
    case zambia = "zambia"
    case zimbabwe = "zimbabwe"
        // correspond "territory-id" values in existing missions-countries xml pages
    case asean = "representative-to-asean"
    case au = "representative-to-au"
    case eu = "representative-to-eu"
    case iaea = "representative-to-iaea"
    case icao = "representative-to-icao"
    case nato = "representative-to-nato"
    case oas = "representative-to-oas"
    case oecd = "representative-to-oecd"
    case osce = "representative-to-osce"
    case un = "representative-to-un"
    case unaf = "representative-to-unafa"
    case unes = "representative-to-unesco"
    case unid = "representative-to-unido"
    case usoa = "representative-to-usoarn"
    case uneo = "representative-uneo"
    case unvo = "representative-unvo"
        // correspond to "id" in existing missions-orgs pages
    case none = "none"
    
    func getCountryCode() -> String {
    let xmlCountry = [
    "afghanistan": ["af", "Afghanistan"],
    "albania": ["al", "Albania"],
    "algeria": ["dz", "Algeria"],
    "andorra": ["ad", "Andorra"],
    "angola": ["ao", "Angola"],
    "antigua-and-barbuda": ["ag", "Antigua and Barbuda"],
    "argentina": ["ar", "Argentina"],
    "armenia":  ["am", "Armenia"],
    "australia": ["au", "Australia"],
    "austria": ["at", "Austria"],
    "azerbaijan": ["az", "Azerbaijan"],
    "bahamas": ["bs", "Bahamas"],
    "bahrain": ["bh", "Bahrain"],
    "bangladesh": ["bd", "Bangladesh"],
    "barbados": ["bb", "Barbados"],
    "belarus": ["by", "Belarus"],
    "belgium": ["be", "Belgium"],
    "belize": ["bz", "Belize"],
    "benin": ["bj", "Benin"],
    "bolivia": ["bo", "Bolivia"],
    "bosnia-herzegovina": ["ba", "Bosnia and Herzegovina"],
    "botswana": ["bw", "Botswana"],
    "brazil": ["br", "Brazil"],
    "brunei": ["bn", "Brunei"],
    "bulgaria": ["bg", "Bulgaria"],
    "burkina-faso": ["bf", "Burkina Faso"],
    "burma": ["bu", "Burma"],
    "burundi": ["bi", "Burundi"],
    "cape-verde": ["cv", "Cape Verde"],
    "cambodia": ["kh", "Cambodia"],
    "cameroon": ["cm", "Cameroon"],
    "canada": ["ca", "Canada"],
    "central-african-republic": ["cf", "Central African Republic"],
    "chad": ["td", "Chad"],
    "chile": ["cl", "Chile"],
    "china": ["cn", "China"],
    "colombia": ["co", "Colombia"],
    "comoros": ["km", "Comoros"],
    "congo-brazzaville": ["cg", "Congo (Brazzaville)"],
    "congo-kinshasa": ["cd", "Congo (Kinshasa)"],
    "costa-rica": ["cr", "Costa Rica"],
    "cote-divoire": ["ci", "Côte d'Ivoire"],
    "croatia": ["hr", "Croatia"],
    "cuba": ["cu", "Cuba"],
    "cyprus": ["cy", "Cyprus"],
    "czech-republic": ["cz", "Czech Republic"],
    "czechoslovakia": ["xe", "Czechoslovakia"],
    "denmark": ["dk", "Denmark"],
    "djibouti": ["dj", "Djibouti"],
    "dominica": ["dm", "Dominica"],
    "dominican-republic": ["do", "Dominican Republic"],
    "ecuador": ["ec", "Ecuador"],
    "egypt": ["eg", "Egypt"],
    "el-salvador": ["sv", "El Salvador"],
    "equatorial-guinea": ["gq", "Equatorial Guinea"],
    "eritrea": ["er", "Eritrea"],
    "estonia": ["ew", "Estonia"],
    "ethiopia": ["et", "Ethioipia"],
    "fiji": ["fj", "Fiji"],
    "finland": ["fi", "Finland"],
    "france": ["fr", "France"],
    "gabon": ["ga", "Gabon"],
    "gambia": ["gm", "The Gambia"],
    "georgia": ["ge", "Georgia"],
    "german-democratic-republic": ["xf", "German Democratic Republic"],
    "germany": ["de", "Germany"],
    "ghana": ["gh", "Ghana"],
    "greece": ["gr", "Greece"],
    "grenada": ["gd", "Grenada"],
    "guatemala": ["gt", "Guatemala"],
    "guinea": ["gn", "Guinea"],
    "guinea-bissau": ["gw", "Guinea-Bissau"],
    "guyana": ["gy", "Guyana"],
    "haiti": ["ht", "Haiti"],
    "hawaii": ["xl", "Hawaii"],
    "holy-see": ["va", "Holy See"],
    "honduras": ["hn", "Honduras"],
    "hungary": ["hu", "Hungary"],
    "iceland": ["is", "Iceland"],
    "india": ["in", "India"],
    "indonesia": ["id", "Indonesia"],
    "iran": ["ir", "Iran"],
    "iraq": ["iq", "Iraq"],
    "ireland": ["ie", "Ireland"],
    "israel": ["il", "Israel"],
    "italy": ["it", "Italy"],
    "jamaica": ["jm", "Jamaica"],
    "japan": ["jp", "Japan"],
    "jordan": ["jo", "Jordan"],
    "kazakhstan": ["kz", "Kazakhstan"],
    "kenya": ["ke", "Kenya"],
    "kiribati": ["ki", "Kiribarti"],
    "korea": ["xb", "Korea"],
    "kosovo": ["xk", "Kosovo"],
    "kuwait": ["kw", "Kuwait"],
    "kyrgyzstan": ["kg", "Kyrgyzstan"],
    "laos": ["la", "Laos"],
    "latvia": ["lv", "Latvia"],
    "lebanon": ["lb", "Lebanon"],
    "lesotho": ["ls", "Lesotho"],
    "liberia": ["lr", "Liberia"],
    "libya": ["ly", "Libya"],
    "liechtenstein": ["li", "Liechtenstein"],
    "lithuania": ["lt", "Lithuania"],
    "luxembourg": ["lu", "Luxembourg"],
    "macedonia": ["mk", "Macedonia"],
    "madagascar": ["mg", "Madagascar"],
    "malawi": ["mw", "Malawi"],
    "malaysia": ["my", "Malaysia"],
    "maldives": ["mv", "Maldives"],
    "mali": ["ml", "Mali"],
    "malta": ["mt", "Malta"],
    "marshall-islands": ["mh", "Marshall Islands"],
    "mauritania": ["mr", "Mauritania"],
    "mauritius": ["mu", "Mauritius"],
    "mexico": ["mx", "Mexico"],
    "micronesia": ["fm", "Micronesia, Federated States of"],
    "moldova": ["md", "Moldova"],
    "monaco": ["mc", "Morocco"],
    "mongolia": ["mn", "Mongolia"],
    "montenegro": ["me", "Montenegro"],
    "morocco": ["ma", "Morocco"],
    "mozambique": ["mz", "Mozambique"],
    "namibia": ["na", "Namibia"],
    "nauru": ["nr", "Nauru"],
    "nepal": ["np", "Nepal"],
    "netherlands": ["nl", "Netherlands"],
    "new-zealand": ["nz", "New Zealand"],
    "nicaragua": ["ni", "Nicaragua"],
    "niger": ["ne", "Niger"],
    "nigeria": ["ng", "Nigeria"],
    "norway": ["no", "Norway"],
    "oman": ["om", "Oman"],
    "pakistan": ["pk", "Pakistan"],
    "palau": ["pw", "Palau"],
    "panama": ["pa", "Panama"],
    "papua-new-guinea": ["pg", "Papua New Guinea"],
    "paraguay": ["py", "Paraguay"],
    "peru": ["pe", "Peru"],
    "philippines": ["ph", "Philippines"],
    "poland": ["pl", "Poland"],
    "portugal": ["pt", "Portugal"],
    "qatar": ["qa", "Qatar"],
    "romania": ["ro", "Romania"],
    "russia": ["ru", "Russia"],
    "rwanda": ["rw", "Rwanda"],
    "saint-kitts-and-nevis": ["kn", "Saint Kitts and Nevis"],
    "saint-lucia": ["lc", "Saint Lucia"],
    "saint-vincent-and-grenadines": ["vc", "Saint Vincent and the Grenadines"],
    "samoa": ["ws", "Samoa"],
    "san-marino": ["sm", "San Marino"],
    "sao-tome-and-principe": ["st", "Sao Tome and Principe"],
    "saudi-arabia": ["sa", "Saudi Arabia"],
    "senegal": ["sn", "Senegal"],
    "serbia": ["rs", "Serbia"],
    "seychelles": ["sc", "Seychelles"],
    "sierra-leone": ["sl", "Sierra Leone"],
    "singapore": ["sg", "Singapore"],
    "slovakia": ["sk", "Slovakia"],
    "slovenia": ["si", "Slovenia"],
    "solomon-islands": ["sb", "Soloman Islands"],
    "somalia": ["so", "Somalia"],
    "south-africa": ["za", "South Africa"],
    "south-sudan": ["ss", "South Sudan"],
    "spain": ["es", "Spain"],
    "sri-lanka": ["lk", "Sri Lanka"],
    "sudan": ["sd", "Sudan"],
    "suriname": ["sr", "Suriname"],
    "swaziland": ["sz", "Swaziland"],
    "sweden": ["se", "Sweden"],
    "switzerland": ["ch", "Switzerland"],
    "syria": ["sy", "Syria"],
    "tajikistan": ["tj", "Tajikistan"],
    "tanzania": ["tz", "Tanzania"],
    "texas": ["xc", "Texas"],
    "thailand": ["th", "Thailand"],
    "timor-leste": ["tl", "Timor-Leste"],
    "togo": ["tg", "Togo"],
    "tonga": ["to", "Tonga"],
    "trinidad-and-tobago": ["tt", "Trinidad and Tobago"],
    "tunisia": ["tn", "Tunisia"],
    "turkey": ["tr", "Turkey"],
    "turkmenistan": ["tm", "Turkmenistan"],
    "tuvalu": ["tv", "Tuvalu"],
    "two-sicilies": ["xg", "Two Sicilies"],
    "uganda": ["ug", "Uganda"],
    "ukraine": ["ua", "Ukraine"],
    "united-arab-emirates": ["ae", "United Arab Emirates"],
    "united-kingdom": ["gb", "United Kingdom"],
    "uruguay": ["uy", "Uruguay"],
    "uzbekistan": ["uz", "Uzbekistan"],
    "vanuatu": ["vu", "Vanuatu"],
    "venezuela": ["ve", "Venezuela"],
    "vietnam": ["vn", "Vietnam"],
    "vietnam-south": ["xh", "South Vietnam"],
    "yemen": ["ye", "Yemen"],
    "yugoslavia": ["xi", "Yugoslavia"],
    "zambia": ["zm", "Zambia"],
    "zimbabwe": ["zw", "Zimbabwe"],
    // correspond to "id":"territory-id" values in existing missions-countries xml pages
    "representative-to-asean": ["asea", "Association of Southeast Asian Nations"],
    "representative-to-au": ["au", "African Union"],
    "representative-to-eu": ["eu", "European Union"],
    "representative-to-iaea": ["iaea", "International Atomic Energy Agency"],
    "representative-to-icao": ["icao", "International Civil Aviation Organization"],
    "representative-to-nato": ["nato", "North Atlantic Treaty Organization"],
    "representative-to-oas": ["oas", "Organization of American States"],
    "representative-to-oecd": ["oecd", "Organization for Economic Cooperation and Development"],
    "representative-to-osce": ["osce", "Organization for Security and Cooperation in Europe"],
    "representative-to-un": ["un", "United Nations"],
    "representative-to-unafa": ["unaf", "United Nations Agencies for Food and Agriculture"],
    "representative-to-unesco": ["unes", "United Nations Educational, Scientific, and Cultural Organization"],
    "representative-to-unido": ["unid", "United Nations Industrial Development Organization"],
    "representative-to-usoarn": ["usoa", "U.S. Office for Arms Reduction Negotiations"],
    "representative-uneo": ["uneo", "European Office of the United Nations"],
    "representative-unvo": ["unvo", "Vienna Office of the United Nations"],
        "none": ["none", "none"]
    ]
        return xmlCountry[self.rawValue]![0]
    }
    func getCountryName() -> String {
    let xmlCountry = [
    "afghanistan": ["af", "Afghanistan"],
    "albania": ["al", "Albania"],
    "algeria": ["dz", "Algeria"],
    "andorra": ["ad", "Andorra"],
    "angola": ["ao", "Angola"],
    "antigua-and-barbuda": ["ag", "Antigua and Barbuda"],
    "argentina": ["ar", "Argentina"],
    "armenia":  ["am", "Armenia"],
    "australia": ["au", "Australia"],
    "austria": ["at", "Austria"],
    "azerbaijan": ["az", "Azerbaijan"],
    "bahamas": ["bs", "Bahamas"],
    "bahrain": ["bh", "Bahrain"],
    "bangladesh": ["bd", "Bangladesh"],
    "barbados": ["bb", "Barbados"],
    "belarus": ["by", "Belarus"],
    "belgium": ["be", "Belgium"],
    "belize": ["bz", "Belize"],
    "benin": ["bj", "Benin"],
    "bolivia": ["bo", "Bolivia"],
    "bosnia-herzegovina": ["ba", "Bosnia and Herzegovina"],
    "botswana": ["bw", "Botswana"],
    "brazil": ["br", "Brazil"],
    "brunei": ["bn", "Brunei"],
    "bulgaria": ["bg", "Bulgaria"],
    "burkina-faso": ["bf", "Burkina Faso"],
    "burma": ["bu", "Burma"],
    "burundi": ["bi", "Burundi"],
    "cape-verde": ["cv", "Cape Verde"],
    "cambodia": ["kh", "Cambodia"],
    "cameroon": ["cm", "Cameroon"],
    "canada": ["ca", "Canada"],
    "central-african-republic": ["cf", "Central African Republic"],
    "chad": ["td", "Chad"],
    "chile": ["cl", "Chile"],
    "china": ["cn", "China"],
    "colombia": ["co", "Colombia"],
    "comoros": ["km", "Comoros"],
    "congo-brazzaville": ["cg", "Congo (Brazzaville)"],
    "congo-kinshasa": ["cd", "Congo (Kinshasa)"],
    "costa-rica": ["cr", "Costa Rica"],
    "cote-divoire": ["ci", "Côte d'Ivoire"],
    "croatia": ["hr", "Croatia"],
    "cuba": ["cu", "Cuba"],
    "cyprus": ["cy", "Cyprus"],
    "czech-republic": ["cz", "Czech Republic"],
    "czechoslovakia": ["xe", "Czechoslovakia"],
    "denmark": ["dk", "Denmark"],
    "djibouti": ["dj", "Djibouti"],
    "dominica": ["dm", "Dominica"],
    "dominican-republic": ["do", "Dominican Republic"],
    "ecuador": ["ec", "Ecuador"],
    "egypt": ["eg", "Egypt"],
    "el-salvador": ["sv", "El Salvador"],
    "equatorial-guinea": ["gq", "Equatorial Guinea"],
    "eritrea": ["er", "Eritrea"],
    "estonia": ["ew", "Estonia"],
    "ethiopia": ["et", "Ethioipia"],
    "fiji": ["fj", "Fiji"],
    "finland": ["fi", "Finland"],
    "france": ["fr", "France"],
    "gabon": ["ga", "Gabon"],
    "gambia": ["gm", "The Gambia"],
    "georgia": ["ge", "Georgia"],
    "german-democratic-republic": ["xf", "German Democratic Republic"],
    "germany": ["de", "Germany"],
    "ghana": ["gh", "Ghana"],
    "greece": ["gr", "Greece"],
    "grenada": ["gd", "Grenada"],
    "guatemala": ["gt", "Guatemala"],
    "guinea": ["gn", "Guinea"],
    "guinea-bissau": ["gw", "Guinea-Bissau"],
    "guyana": ["gy", "Guyana"],
    "haiti": ["ht", "Haiti"],
    "hawaii": ["xl", "Hawaii"],
    "holy-see": ["va", "Holy See"],
    "honduras": ["hn", "Honduras"],
    "hungary": ["hu", "Hungary"],
    "iceland": ["is", "Iceland"],
    "india": ["in", "India"],
    "indonesia": ["id", "Indonesia"],
    "iran": ["ir", "Iran"],
    "iraq": ["iq", "Iraq"],
    "ireland": ["ie", "Ireland"],
    "israel": ["il", "Israel"],
    "italy": ["it", "Italy"],
    "jamaica": ["jm", "Jamaica"],
    "japan": ["jp", "Japan"],
    "jordan": ["jo", "Jordan"],
    "kazakhstan": ["kz", "Kazakhstan"],
    "kenya": ["ke", "Kenya"],
    "kiribati": ["ki", "Kiribarti"],
    "korea": ["xb", "Korea"],
    "kosovo": ["xk", "Kosovo"],
    "kuwait": ["kw", "Kuwait"],
    "kyrgyzstan": ["kg", "Kyrgyzstan"],
    "laos": ["la", "Laos"],
    "latvia": ["lv", "Latvia"],
    "lebanon": ["lb", "Lebanon"],
    "lesotho": ["ls", "Lesotho"],
    "liberia": ["lr", "Liberia"],
    "libya": ["ly", "Libya"],
    "liechtenstein": ["li", "Liechtenstein"],
    "lithuania": ["lt", "Lithuania"],
    "luxembourg": ["lu", "Luxembourg"],
    "macedonia": ["mk", "Macedonia"],
    "madagascar": ["mg", "Madagascar"],
    "malawi": ["mw", "Malawi"],
    "malaysia": ["my", "Malaysia"],
    "maldives": ["mv", "Maldives"],
    "mali": ["ml", "Mali"],
    "malta": ["mt", "Malta"],
    "marshall-islands": ["mh", "Marshall Islands"],
    "mauritania": ["mr", "Mauritania"],
    "mauritius": ["mu", "Mauritius"],
    "mexico": ["mx", "Mexico"],
    "micronesia": ["fm", "Micronesia, Federated States of"],
    "moldova": ["md", "Moldova"],
    "monaco": ["mc", "Morocco"],
    "mongolia": ["mn", "Mongolia"],
    "montenegro": ["me", "Montenegro"],
    "morocco": ["ma", "Morocco"],
    "mozambique": ["mz", "Mozambique"],
    "namibia": ["na", "Namibia"],
    "nauru": ["nr", "Nauru"],
    "nepal": ["np", "Nepal"],
    "netherlands": ["nl", "Netherlands"],
    "new-zealand": ["nz", "New Zealand"],
    "nicaragua": ["ni", "Nicaragua"],
    "niger": ["ne", "Niger"],
    "nigeria": ["ng", "Nigeria"],
    "norway": ["no", "Norway"],
    "oman": ["om", "Oman"],
    "pakistan": ["pk", "Pakistan"],
    "palau": ["pw", "Palau"],
    "panama": ["pa", "Panama"],
    "papua-new-guinea": ["pg", "Papua New Guinea"],
    "paraguay": ["py", "Paraguay"],
    "peru": ["pe", "Peru"],
    "philippines": ["ph", "Philippines"],
    "poland": ["pl", "Poland"],
    "portugal": ["pt", "Portugal"],
    "qatar": ["qa", "Qatar"],
    "romania": ["ro", "Romania"],
    "russia": ["ru", "Russia"],
    "rwanda": ["rw", "Rwanda"],
    "saint-kitts-and-nevis": ["kn", "Saint Kitts and Nevis"],
    "saint-lucia": ["lc", "Saint Lucia"],
    "saint-vincent-and-grenadines": ["vc", "Saint Vincent and the Grenadines"],
    "samoa": ["ws", "Samoa"],
    "san-marino": ["sm", "San Marino"],
    "sao-tome-and-principe": ["st", "Sao Tome and Principe"],
    "saudi-arabia": ["sa", "Saudi Arabia"],
    "senegal": ["sn", "Senegal"],
    "serbia": ["rs", "Serbia"],
    "seychelles": ["sc", "Seychelles"],
    "sierra-leone": ["sl", "Sierra Leone"],
    "singapore": ["sg", "Singapore"],
    "slovakia": ["sk", "Slovakia"],
    "slovenia": ["si", "Slovenia"],
    "solomon-islands": ["sb", "Soloman Islands"],
    "somalia": ["so", "Somalia"],
    "south-africa": ["za", "South Africa"],
    "south-sudan": ["ss", "South Sudan"],
    "spain": ["es", "Spain"],
    "sri-lanka": ["lk", "Sri Lanka"],
    "sudan": ["sd", "Sudan"],
    "suriname": ["sr", "Suriname"],
    "swaziland": ["sz", "Swaziland"],
    "sweden": ["se", "Sweden"],
    "switzerland": ["ch", "Switzerland"],
    "syria": ["sy", "Syria"],
    "tajikistan": ["tj", "Tajikistan"],
    "tanzania": ["tz", "Tanzania"],
    "texas": ["xc", "Texas"],
    "thailand": ["th", "Thailand"],
    "timor-leste": ["tl", "Timor-Leste"],
    "togo": ["tg", "Togo"],
    "tonga": ["to", "Tonga"],
    "trinidad-and-tobago": ["tt", "Trinidad and Tobago"],
    "tunisia": ["tn", "Tunisia"],
    "turkey": ["tr", "Turkey"],
    "turkmenistan": ["tm", "Turkmenistan"],
    "tuvalu": ["tv", "Tuvalu"],
    "two-sicilies": ["xg", "Two Sicilies"],
    "uganda": ["ug", "Uganda"],
    "ukraine": ["ua", "Ukraine"],
    "united-arab-emirates": ["ae", "United Arab Emirates"],
    "united-kingdom": ["gb", "United Kingdom"],
    "uruguay": ["uy", "Uruguay"],
    "uzbekistan": ["uz", "Uzbekistan"],
    "vanuatu": ["vu", "Vanuatu"],
    "venezuela": ["ve", "Venezuela"],
    "vietnam": ["vn", "Vietnam"],
    "vietnam-south": ["xh", "South Vietnam"],
    "yemen": ["ye", "Yemen"],
    "yugoslavia": ["xi", "Yugoslavia"],
    "zambia": ["zm", "Zambia"],
    "zimbabwe": ["zw", "Zimbabwe"],
    // correspond to "id":"territory-id" values in existing missions-countries xml pages
    "representative-to-asean": ["asea", "Association of Southeast Asian Nations"],
    "representative-to-au": ["au", "African Union"],
    "representative-to-eu": ["eu", "European Union"],
    "representative-to-iaea": ["iaea", "International Atomic Energy Agency"],
    "representative-to-icao": ["icao", "International Civil Aviation Organization"],
    "representative-to-nato": ["nato", "North Atlantic Treaty Organization"],
    "representative-to-oas": ["oas", "Organization of American States"],
    "representative-to-oecd": ["oecd", "Organization for Economic Cooperation and Development"],
    "representative-to-osce": ["osce", "Organization for Security and Cooperation in Europe"],
    "representative-to-un": ["un", "United Nations"],
    "representative-to-unafa": ["unaf", "United Nations Agencies for Food and Agriculture"],
    "representative-to-unesco": ["unes", "United Nations Educational, Scientific, and Cultural Organization"],
    "representative-to-unido": ["unid", "United Nations Industrial Development Organization"],
    "representative-to-usoarn": ["usoa", "U.S. Office for Arms Reduction Negotiations"],
    "representative-uneo": ["uneo", "European Office of the United Nations"],
    "representative-unvo": ["unvo", "Vienna Office of the United Nations"],
    "none": ["none", "none"]
    ]
        return xmlCountry[self.rawValue]![1]
    }
}
