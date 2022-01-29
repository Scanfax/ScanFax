//
//  PremiumViewController.swift
//  ScanFax
//
//  Created by YoungHafner on 26/01/2022.
//

import UIKit
import StoreKit

class PremiumViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // - Constraints
    @IBOutlet weak var logoImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var logoTitleLabelTopConstraint: NSLayoutConstraint!
    
    // - Manager
    private var layoutManager: PremiumLayoutManager!
    private let viewModelManager = PremiumViewModelManager()
    
    // - Data source
    private var priceDataSource: PremiumCollectionViewDataSource!
    
    // - Data
    private var products = [SKProduct]()
    private var selectedViewModel: PremiumCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    @IBAction func closeButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func trialSwitchAction(_ sender: UISwitch) {
        priceDataSource.updateTryForFree(isOn: sender.isOn)
    }
    
    @IBAction func subscribeButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func restoreButtonAction(_ sender: Any) {
    }
    
    
    @IBAction func privacyButtonAction(_ sender: Any) {
    }
    
    @IBAction func termsButtonAction(_ sender: Any) {
    }
    
}

// MARK: -
// MARK: - PremiumDataSource Delegate

extension PremiumViewController: PremiumDataSourceDelegate {
   
    func updateSelectedProduct(viewModel: PremiumCellViewModel) {
        print("aaa")
    }
    
}

// MARK: -
// MARK: - Configure

private extension PremiumViewController {
    
    func configure() {
        configureLayoutManager()
        configureDataSource()
        configureProducts() 
    }
    
    func configureLayoutManager() {
        layoutManager = PremiumLayoutManager(viewController: self)
    }
    
    func configureDataSource() {
        priceDataSource = PremiumCollectionViewDataSource(collectionView: collectionView, delegate: self)
    }
    
    func configureProducts() {
        PremiumManager.shared.fetch(purchaseIds: Set(AppConstant.subscriptionIds + AppConstant.trialIds)) { [weak self] (products) in
            if products.count != 6 {
                self?.dismiss(animated: true, completion: nil)
                return
            }
            self?.products = products
            self?.configureViewModels()
           // self?.layoutManager.dismissLoading()
        }
    }
    
    func configureViewModels() {
        let viewModels = viewModelManager.configure(products: products)
        priceDataSource.update(viewModels: viewModels)
    }
    
}
