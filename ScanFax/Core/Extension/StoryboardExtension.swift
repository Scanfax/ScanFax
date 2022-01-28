//
//  StoryboardExtension.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

extension UIStoryboard {
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.filename, bundle: bundle)
    }
    
}
