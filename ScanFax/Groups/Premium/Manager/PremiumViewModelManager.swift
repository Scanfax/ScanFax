//
//  PremiumViewModelManager.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import UIKit
import StoreKit

class PremiumViewModelManager {
    
    func configure(products: [SKProduct]) -> (common: [PremiumCellViewModel], trial: [PremiumCellViewModel]) {
        var common = [PremiumCellViewModel]()
        var trial = [PremiumCellViewModel]()
        
        if let productOne = product(id: AppConstant.subscriptionIds[0], products: products) {
            common.append(PremiumCellViewModel(id: AppConstant.subscriptionIds[0], showDealView: false, date: "WEEKLY".localized, price: productOne.localizedPrice, isSelected: false, isTrial: false))
        }
        if let productTwo = product(id: AppConstant.subscriptionIds[1], products: products) {
            common.append(PremiumCellViewModel(id: AppConstant.subscriptionIds[1], showDealView: false, date: "MONTHLY", price: productTwo.localizedPrice, isSelected: true, isTrial: false))
        }
        if let productThree = product(id: AppConstant.subscriptionIds[2], products: products) {
            common.append(PremiumCellViewModel(id: AppConstant.subscriptionIds[2], showDealView: true, date: "YEARLY", price: productThree.localizedPrice, isSelected: false, isTrial: false))
        }
        
        if let productFour = product(id: AppConstant.trialIds[0], products: products) {
            trial.append(PremiumCellViewModel(id: AppConstant.trialIds[0], showDealView: false, date: "WEEKLY", price: productFour.localizedPrice, isSelected: false, isTrial: true))
        }
        if let productFive = product(id: AppConstant.trialIds[1], products: products) {
            trial.append(PremiumCellViewModel(id: AppConstant.trialIds[1], showDealView: false, date: "MONTHLY", price: productFive.localizedPrice, isSelected: true, isTrial: true))
        }
        if let productSix = product(id: AppConstant.trialIds[2], products: products) {
            trial.append(PremiumCellViewModel(id: AppConstant.trialIds[2], showDealView: true, date: "YEARLY", price: productSix.localizedPrice, isSelected: false, isTrial: true))
        }
        
        return (common, trial)
    }
    
    private func product(id: String, products: [SKProduct]) -> SKProduct? {
        return products.first(where: {$0.productIdentifier == id})
    }
    
}
