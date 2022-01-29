//
//  PremiumLayoutManager.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import UIKit

class PremiumLayoutManager {
    
    // - UI
    private unowned let viewController: PremiumViewController
    
    init(viewController: PremiumViewController) {
        self.viewController = viewController
        configure()
    }
    
}

// MARK: -
// MARK: - Configure

private extension PremiumLayoutManager {
    
    func configure() {
        configureButtons()
        configureConstraints()
    }
    
    func configureButtons() {
        viewController.privacyButton.contentHorizontalAlignment = .left
        viewController.termsButton.contentHorizontalAlignment = .right
    }
    
    func configureConstraints() {
        confgiureConstraintsForSmallScreen()
        configureConstraintsForBigScreen()
    }
    
    func confgiureConstraintsForSmallScreen() {
        if ScreenSize.screenHeight < 680 {
            viewController.logoImageViewTopConstraint.constant = 12
            viewController.titleLabelBottomConstraint.constant = 6
        }
    }
    
    func configureConstraintsForBigScreen() {
        if ScreenSize.screenHeight > 930 {
            viewController.logoImageViewTopConstraint.constant = 60
            viewController.logoImageViewHeightConstraint.constant = 500
            viewController.logoImageViewWidthConstraint.constant = 248
            viewController.logoTitleLabelTopConstraint.constant = -66
        }
    }
}
