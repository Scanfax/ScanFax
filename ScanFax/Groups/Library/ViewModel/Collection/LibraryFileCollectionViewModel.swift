//
//  LibraryFileCollectionViewModel.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

struct LibraryFileCollectionViewModel: CollectionViewModelProtocol {
    
    var size: CGSize
    
    init(isTableDisplay: Bool) {
        let width = (UIScreen.main.bounds.width - 36 - 10) / 2
        size = CGSize(width: width, height: width * 1.4)
    }
}
