//
//  Storyboard.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import Foundation

enum Storyboard: String {
    
    case onboarding = "Onboarding"
    case premium = "Premium"
    case library = "Library"

    var filename: String {
        return rawValue
    }
    
}
