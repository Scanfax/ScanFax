//
//  PremiumCollectionViewDataSource.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import UIKit

protocol PremiumDataSourceDelegate: AnyObject {
    
    func updateSelectedProduct(viewModel: PremiumCellViewModel)
    
}

class PremiumCollectionViewDataSource: NSObject {
    
    // - UI
    private unowned var collectionView: UICollectionView
    
    // - Delegate
    private unowned let delegate: PremiumDataSourceDelegate
    
    // - Data
    private var common = [PremiumCellViewModel]()
    private var trial = [PremiumCellViewModel]()
    private var tryForFreeOn = false
    
    init(collectionView: UICollectionView, delegate: PremiumDataSourceDelegate) {
        self.collectionView = collectionView
        self.delegate = delegate
        super.init()
        configure()
    }
    
    func update(viewModels: (common: [PremiumCellViewModel], trial: [PremiumCellViewModel])) {
        self.common = viewModels.common
        self.trial = viewModels.trial
        collectionView.reloadData()
    }
    
    func updateTryForFree(isOn: Bool) {
        tryForFreeOn = isOn
        collectionView.reloadData()
        
        if isOn {
            if let vm = trial.first(where: {$0.isSelected == true}) {
                delegate.updateSelectedProduct(viewModel: vm)
            }
        } else {
            if let vm = common.first(where: {$0.isSelected == true}) {
                delegate.updateSelectedProduct(viewModel: vm)
            }
        }
    }
    
}

// MARK: -
// MARK: - Collection view data source

extension PremiumCollectionViewDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return common.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PremiumCollectionViewCell", for: indexPath) as! PremiumCollectionViewCell
        let viewModel = tryForFreeOn ? trial[indexPath.item] : common[indexPath.item]
        cell.setup(viewModel: viewModel)
        return cell
    }
    
}

// MARK: -
// MARK: - Collection view delegate

extension PremiumCollectionViewDataSource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 16) / 3
        let height = collectionView.bounds.size.height
        return CGSize(width: width, height: height)
//        if UIScreen.main.bounds.width < 375 {
//            return CGSize(width: 99, height: 141)
//        } else {
//            return CGSize(width: 109, height: 141)
//        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        if UIScreen.main.bounds.width < 375 {
//            let sideInset = floor((UIScreen.main.bounds.width - (99 * 3 + 16)) / 2)
//            return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
//        } else {
//            let sideInset = floor((UIScreen.main.bounds.width - (109 * 3 + 20)) / 2)
//            return UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if UIScreen.main.bounds.width < 375 {
//            return 8
//        } else {
//            return 10
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selected = common.firstIndex(where: {$0.isSelected}) else { return }
        if selected != indexPath.item {
            common[selected].isSelected = false
            common[indexPath.item].isSelected = true
            trial[selected].isSelected = false
            trial[indexPath.item].isSelected = true
            
            if let cell = collectionView.cellForItem(at: IndexPath(item: selected, section: 0)) as? PremiumCollectionViewCell {
                cell.updateSelection(isSelected: false)
            }
            
            if let cell = collectionView.cellForItem(at: indexPath) as? PremiumCollectionViewCell {
                cell.updateSelection(isSelected: true)
            }
            
            delegate.updateSelectedProduct(viewModel: tryForFreeOn ? trial[indexPath.item] : common[indexPath.item])
        }
    }

}

// MARK: -
// MARK: - Configure

private extension PremiumCollectionViewDataSource {
    
    func configure() {
        configureCollectionView()
    }

    func configureCollectionView() {
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PremiumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PremiumCollectionViewCell")
    }
    
}
