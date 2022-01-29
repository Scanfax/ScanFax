//
//  SKProductExtension.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import Foundation
import StoreKit

extension SKProduct {
    
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
    
    var doublePrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price.multiplying(by: 2))!
    }
    
    func oneMonthPrice() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        
        let quarter = NSDecimalNumber(value: 12)
        let newPrice = price.dividing(by: quarter)
        
        return formatter.string(from: newPrice)!
    }
        
}
