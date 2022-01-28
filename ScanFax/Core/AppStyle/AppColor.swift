//
//  AppColor.swift
//  ScanFax
//
//  Created by YoungHafner on 26/01/2022.
//

import UIKit

enum AppColor {
    
    static func black(alpha: CGFloat = 1.0) -> UIColor {
        return color(fromHex: "#202020").withAlphaComponent(alpha)
    }
    
    static func blackBorder(alpha: CGFloat = 1.0) -> UIColor {
        return color(fromHex: "#000000").withAlphaComponent(alpha)
    }
    
    static func white(alpha: CGFloat = 1.0) -> UIColor {
        return color(fromHex: "#FFFFFF").withAlphaComponent(alpha)
    }
    
}

// MARK: -
// MARK: - Calc color

extension AppColor {
    
    static func color(fromHex hex: String) -> UIColor {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: 1.0)
    }
    
}
