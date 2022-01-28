//
//  OnboardingCollectionViewCell.swift
//  ScanFax
//
//  Created by YoungHafner on 25/01/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // - UI
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var screenImageView: UIImageView!
    
    // - Constraints
    @IBOutlet weak var bottomGradientViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var screenImageViewTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func setup(viewModel: OnboardingCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        if let imageName = UIImage(named: viewModel.imageName) {
            screenImageView.image = imageName
        }
    }
    
}

// MARK: -
// MARK: - Configure

private extension OnboardingCollectionViewCell {
    
    func configure() {
        configureConstraints()
    }
    
    func configureConstraints() {
        bottomGradientViewHeightConstraint.constant = ScreenSize.screenHeight / 5.17
        screenImageViewTopConstraint.constant = ScreenSize.screenHeight / 18.5
    }
    
}
