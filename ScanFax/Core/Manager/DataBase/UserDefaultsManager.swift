//
//  UserDefaultsManager.swift
//  ScanFax
//
//  Created by YoungHafner on 26/01/2022.
//

import Foundation

class UserDefaultsManager {
    
    // - Vars
    private let userDefaults = UserDefaults()
    
    enum Data: String {
        
        case isNotFirstLaunch
        case subscriptionIsEnabled
        
    }
    
}

// MARK: - Get
extension UserDefaultsManager {
    
    func getValue(data: Data) -> Bool {
        return userDefaults.bool(forKey: data.rawValue)
    }
    
}

// MARK: - Save
extension UserDefaultsManager {
    
    func saveValue(value: Bool, data: Data) {
        userDefaults.set(value, forKey: data.rawValue)
    }
    
}
