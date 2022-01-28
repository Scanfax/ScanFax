//
//  LibraryViewModelManager.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import Foundation

class LibraryViewModelManager {
    
    func configureViewModels() -> [CollectionViewModelProtocol] {
        var viewModels = [CollectionViewModelProtocol]()
        
        let vm1 = LibraryDateCollectionViewModel()
        viewModels.append(vm1)
        
        let vm2 = LibraryFileCollectionViewModel(isTableDisplay: true)
        viewModels.append(vm2)
        
        let vm3 = LibraryFloderCollectionViewModel()
        viewModels.append(vm3)
        
        let vm4 = LibrarySecureFloderCollectionViewModel()
        viewModels.append(vm4)
        
        return viewModels
    }
}
