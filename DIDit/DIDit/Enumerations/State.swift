//
//  State.swift
//  DID IT
//
//  Created by Joshua Botts on 9/19/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum USState: String, Identifiable, CaseIterable {
    case alaska             = "ak"
    case alabama            = "al"
    case arkansas           = "ar"
    case americanSamoa      = "as"
    case arizona            = "az"
    case california         = "ca"
    case colorado           = "co"
    case connecticut        = "ct"
    case districtOfColumbia = "dc"
    case delaware           = "de"
    case florida            = "fl"
    case georgia            = "ga"
    case guam               = "gu"
    case hawaii             = "hi"
    case iowa               = "ia"
    case idaho              = "id"
    case illinois           = "il"
    case indiana            = "in"
    case kansas             = "ks"
    case kentucky           = "ky"
    case louisiana          = "la"
    case massachusetts      = "ma"
    case maryland           = "md"
    case maine              = "me"
    case michigan           = "mi"
    case minnesota          = "mn"
    case missouri           = "mo"
    case mississippi        = "ms"
    case montana            = "mt"
    case northCarolina      = "nc"
    case northDakota        = "nd"
    case nebraska           = "ne"
    case newHampshire       = "nh"
    case newJersey          = "nj"
    case newMexico          = "nm"
    case nevada             = "nv"
    case newYork            = "ny"
    case ohio               = "oh"
    case oklahoma           = "ok"
    case oregon             = "or"
    case pennsylvania       = "pa"
    case puertoRico         = "pr"
    case rhodeIsland        = "ri"
    case southCarolina      = "sc"
    case southDakota        = "sd"
    case tennessee          = "tn"
    case texas              = "tx"
    case utah               = "ut"
    case virginia           = "va"
    case virginIslands      = "vi"
    case vermont            = "vt"
    case washington         = "wa"
    case wisconsin          = "wi"
    case westVirginia       = "wv"
    case wyoming            = "wy"
    case none               = ""
    
    var id: String {
        return self.rawValue
    }
    
    func getStateName() -> String {
        let stateNames = [
            "ak": "Alaska",
            "al": "Alabama",
            "ar": "Arkansas",
            "as": "American Samoa",
            "az": "Arizona",
            "ca": "California",
            "co": "Colorado",
            "ct": "Connecticut",
            "dc": "District of Columbia",
            "de": "Deleware",
            "fl": "Florida",
            "ga": "Georgia",
            "gu": "Guam",
            "hi": "Hawaii",
            "ia": "Iowa",
            "id": "Idaho",
            "il": "Illinois",
            "in": "Indiana",
            "ks": "Kansas",
            "ky": "Kentucky",
            "la": "Louisiana",
            "ma": "Massachusetts",
            "md": "Maryland",
            "me": "Maine",
            "mi": "Michigan",
            "mn": "Minnesota",
            "mo": "Missouri",
            "ms": "Mississippi",
            "mt": "Montana",
            "nc": "North Carolina",
            "nd": "North Dakota",
            "ne": "Nebraska",
            "nh": "New Hampshire",
            "nj": "New Jersey",
            "nm": "New Mexico",
            "nv": "Nevada",
            "ny": "New York",
            "oh": "Ohio",
            "ok": "Oklahoma",
            "or": "Oregon",
            "pa": "Pennsylvania",
            "pr": "Puerto Rico",
            "ri": "Rhode Island",
            "sc": "South Carolina",
            "sd": "South Dakota",
            "tn": "Tennessee",
            "tx": "Texas",
            "ut": "Utah",
            "va": "Virginia",
            "vi": "Virgin Islands",
            "vt": "Vermont",
            "wa": "Washington",
            "wi": "Wisconsin",
            "wv": "West Virginia",
            "wy": "Wyoming",
            "": "No state identified."
        ]
        return stateNames[self.rawValue]!
    }
}
