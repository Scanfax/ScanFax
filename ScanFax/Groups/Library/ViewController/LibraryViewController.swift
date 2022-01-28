//
//  LibraryViewController.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

class LibraryViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gradientView: UIView!
    
    // - Manager
    private var coordinatorManager: LibraryCoordinatorManager!
    private var viewModelManager = LibraryViewModelManager()
    private var layoutManager: LibraryLayoutManager!
    
    // - Data Source
    private var dataSource: LibraryCollectionDataSource!
    
    var isFirst = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutManager.layoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        coordinatorManager.showOnboardingScreen()
    }

}

// MARK: -
// MARK: - OnboardingViewController Delegate

extension LibraryViewController: OnboardingViewControllerDelegate {
    
    func showSubscription() {
        coordinatorManager.showPremiumScreen()
    }
    
}

// MARK: -
// MARK: - Configure

private extension LibraryViewController {
    
    func configure() {
        configureCoordinatorManager()
        configureLayoutManager()
        configureDataSource()
        configureViewModels()
    }
    
    func configureCoordinatorManager() {
        coordinatorManager = LibraryCoordinatorManager(viewController: self)
    }
    
    func configureLayoutManager() {
        layoutManager = LibraryLayoutManager(viewController: self)
    }
    
    func configureDataSource() {
        dataSource = LibraryCollectionDataSource(collectionView: collectionView)
    }
    
    func configureViewModels() {
        let viewModels = viewModelManager.configureViewModels()
        dataSource.update(viewModels: viewModels)
    }
    
}
