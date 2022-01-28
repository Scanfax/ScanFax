//
//  LibraryFloderCollectionViewModel.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

struct LibraryFloderCollectionViewModel: CollectionViewModelProtocol {
    
    var size: CGSize
    
    init() {
        let width = (UIScreen.main.bounds.width - 36 - 10) / 2
        size = CGSize(width: width, height: width * 1.4)
    }
    
}
