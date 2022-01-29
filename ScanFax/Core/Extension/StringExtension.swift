//
//  StringExtension.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import UIKit

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }

}
