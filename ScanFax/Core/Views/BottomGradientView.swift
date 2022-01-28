//
//  BottomGradientView.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

class BottomGradientView: UIView {
    
    // - UI
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}

//MARK: -
//MARK: - Configure

private extension BottomGradientView {
    
    func configure() {
        addGradient()
    }
    
    func addGradient() {
        gradientLayer.colors = [UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor, UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5*self.bounds.size.width, dy: -0.5*self.bounds.size.height)
        gradientLayer.position = self.center
        layer.addSublayer(gradientLayer)
    }

}
