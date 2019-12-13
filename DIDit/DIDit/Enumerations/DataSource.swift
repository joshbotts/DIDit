//
//  DataSource.swift
//  DID IT
//
//  Created by Joshua Botts on 10/10/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum DataSource: String {
    case xml
    case json
    case app
    
    func getSource() -> String {
        if self == .xml {
            return "Native XML"
        } else if self == .json {
            return "Tweaked JSON"
        } else if self == .app {
            return "DIDit.app"
        } else {
            return "Not identified"
        }
    }
}
