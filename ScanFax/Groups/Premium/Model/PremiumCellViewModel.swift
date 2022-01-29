//
//  PremiumCellViewModel.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import Foundation

class PremiumCellViewModel {
    
    var id: String
    var showDealView: Bool
    var date: String
    var price: String
    var isSelected: Bool
    var isTrial: Bool
    
    init(id: String, showDealView: Bool, date: String, price: String, isSelected: Bool, isTrial: Bool) {
        self.id = id
        self.showDealView = showDealView
        self.date = date
        self.price = price
        self.isSelected = isSelected
        self.isTrial = isTrial
    }
}
