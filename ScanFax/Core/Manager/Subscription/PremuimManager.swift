//
//  PremuimManager.swift
//  ScanFax
//
//  Created by YoungHafner on 29/01/2022.
//

import UIKit
import SwiftyStoreKit
import StoreKit

class PremiumManager {
    
    // - Shared
    static let shared = PremiumManager()
    
    // - Manager
    private let userDefaultsManager = UserDefaultsManager()
    
    func hasActiveSubscription() -> Bool {
        return userDefaultsManager.getValue(data: .subscriptionIsEnabled)
    }
    
    func setSubscription(enable: Bool) {
        userDefaultsManager.saveValue(value: enable, data: .subscriptionIsEnabled)
    }
    
    func fetch(purchaseIds: Set<String>, completion: @escaping ((_ products: [SKProduct]) -> Void)) {
        SwiftyStoreKit.retrieveProductsInfo(purchaseIds) { result in
            let array = result.retrievedProducts.sorted(by: { $0.price.doubleValue < $1.price.doubleValue })
            completion(array)
        }
    }
    
    func restorePurchases(completion: @escaping (() -> Void)) {
        SwiftyStoreKit.restorePurchases(atomically: true) { [weak self] results in
            if results.restoreFailedPurchases.count > 0 {
                completion()
            } else if results.restoredPurchases.count > 0 {
                self?.setSubscription(enable: true)
                completion()
            } else {
                self?.setSubscription(enable: false)
                completion()
            }
        }
    }
    
    func completeTransaction() {
        SwiftyStoreKit.completeTransactions(atomically: true) { purchases in
            for purchase in purchases {
                switch purchase.transaction.transactionState {
                case .purchased, .restored:
                    if purchase.needsFinishTransaction {
                        SwiftyStoreKit.finishTransaction(purchase.transaction)
                    }
                case .failed, .purchasing, .deferred:
                    break
                @unknown default:
                    break
                }
            }
        }
    }
    
    func purchase(id: String, completion: @escaping (_ error: SKError?) -> Void) {
        SwiftyStoreKit.purchaseProduct(id, atomically: true) { [weak self] result in
            switch result {
            case .success(let purchase):
                if purchase.needsFinishTransaction {
                    SwiftyStoreKit.finishTransaction(purchase.transaction)
                }
                self?.setSubscription(enable: true)
                completion(nil)
            case .error(let error):
                self?.setSubscription(enable: false)
                completion(error)
            }
        }
    }

}
