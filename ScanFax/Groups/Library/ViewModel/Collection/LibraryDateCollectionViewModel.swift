//
//  LibraryDateCollectionViewModel.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

struct LibraryDateCollectionViewModel: CollectionViewModelProtocol {
    
    var size: CGSize
    
    init() {
        size = CGSize(width: UIScreen.main.bounds.width - 36, height: 51)
    }
    
}
