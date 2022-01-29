//
//  OnboardingCellViewModel.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import Foundation

class OnboardingCellViewModel {
    
    var title: String
    var subtitle: String
    var imageName: String
    
    init(title: String, subtitle: String, imageName: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
}

