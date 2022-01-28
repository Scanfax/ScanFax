//
//  LibraryLayoutManager.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

class LibraryLayoutManager {
    
    private var gradient = CAGradientLayer()
    
    private unowned let viewController: LibraryViewController
    
    init(viewController: LibraryViewController) {
        self.viewController = viewController
        configure()
    }
    
    func layoutSubviews() {
        gradient.frame = viewController.gradientView.bounds
    }

}

// MARK: -
// MARK: - Configure

private extension LibraryLayoutManager {
    
    func configure() {
        configureGradientView()
    }
    
    func configureGradientView() {
        gradient = gradientLayer()
        viewController.gradientView.layer.insertSublayer(gradient, at: 0)
    }
    
    func gradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [AppColor.white(alpha: 0).cgColor, AppColor.white(alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }
    
}
