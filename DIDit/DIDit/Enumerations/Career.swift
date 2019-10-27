//
//  Career.swift
//  DID IT
//
//  Created by Joshua Botts on 9/26/19.
//  Copyright © 2019 Joshua Botts. All rights reserved.
//

import Foundation

enum Career: String, Identifiable, CaseIterable {
    case pre1915 = "Pre-Foreign Service Act of 1915"
    case nonCareer = "Political appointee"
    case careerFSO = "Career Foreign Service Officer"
    case none = "None identified"
//    case careerSES = "Career Senior Executive Service"
    
    var id: String {
        return self.rawValue
    }
    
    func getCode() -> String {
        switch self {
        case .pre1915: return "pre-1915"
        case .careerFSO: return "career"
        case .nonCareer: return "non-career"
        case .none: return ""
        }
    }
}
