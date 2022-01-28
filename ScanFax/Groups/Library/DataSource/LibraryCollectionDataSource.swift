//
//  LibraryCollectionDataSource.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

class LibraryCollectionDataSource: NSObject {
    
    // - UI
    private unowned let collectionView: UICollectionView
    
    // - Data
    var viewModels = [CollectionViewModelProtocol]()
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        configure()
    }
    
    func update(viewModels: [CollectionViewModelProtocol]) {
        self.viewModels = viewModels
    }
}


// MARK: -
// MARK: - Collection view data source

extension LibraryCollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = viewModels[indexPath.item]
        if let viewModel = viewModel as? LibraryDateCollectionViewModel {
            return dateCell(collectionView, cellForItemAt: indexPath, viewModel: viewModel)
        } else if let viewModel = viewModel as? LibraryFileCollectionViewModel {
            return fileCell(collectionView, cellForItemAt: indexPath, viewModel: viewModel)
        } else if let viewModel = viewModel as? LibraryFloderCollectionViewModel {
            return floderCell(collectionView, cellForItemAt: indexPath, viewModel: viewModel)
        } else if let viewModel = viewModel as? LibrarySecureFloderCollectionViewModel {
            return secureFloderCell(collectionView, cellForItemAt: indexPath, viewModel: viewModel)
        } else {
            return UICollectionViewCell()
        }
    }
    
}

// MARK: -
// MARK: - Configure cell

private extension LibraryCollectionDataSource {
    
    func dateCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModel: LibraryDateCollectionViewModel) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.date.rawValue, for: indexPath) as! LibraryDateCollectionViewCell
        return cell
    }
    
    func fileCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModel: LibraryFileCollectionViewModel) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.file.rawValue, for: indexPath) as! LibraryFileCollectionViewCell
        return cell
    }
    
    func floderCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModel: LibraryFloderCollectionViewModel) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.floder.rawValue, for: indexPath) as! LibraryFloderCollectionViewCell
        return cell
    }
    
    func secureFloderCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, viewModel: LibrarySecureFloderCollectionViewModel) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.secureFloder.rawValue, for: indexPath) as! LibrarySecureFloderCollectionViewCell
        return cell
    }
    
}

// MARK: -
// MARK: - Collection view delegate

extension LibraryCollectionDataSource: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModels[indexPath.item].size
    }

}


// MARK: -
// MARK: - Configure

private extension LibraryCollectionDataSource {
    
    func configure() {
        configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    enum Constant: String {
        case date = "LibraryDateCollectionViewCell"
        case file = "LibraryFileCollectionViewCell"
        case floder = "LibraryFloderCollectionViewCell"
        case secureFloder = "LibrarySecureFloderCollectionViewCell"
    }
    
}

