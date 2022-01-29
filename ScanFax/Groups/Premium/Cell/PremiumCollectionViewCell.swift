//
//  PremiumCollectionViewCell.swift
//  ScanFax
//
//  Created by YoungHafner on 28/01/2022.
//

import UIKit

class PremiumCollectionViewCell: UICollectionViewCell {
    
    // - UI
    @IBOutlet weak var backgroundContainerView: UIView!
    @IBOutlet weak var bestOfferView: UIView!
    @IBOutlet weak var termLabel: UILabel!
    @IBOutlet weak var trialLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func setup(viewModel: PremiumCellViewModel) {
        termLabel.text = viewModel.date
        priceLabel.text = viewModel.price
        bestOfferView.isHidden = !viewModel.showDealView
        backgroundContainerView.layer.borderColor = viewModel.showDealView ? AppColor.rose().cgColor : UIColor.clear.cgColor
        selectProduct(isSelected: viewModel.isSelected)
    }
    
    func updateSelection(isSelected: Bool) {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.selectProduct(isSelected: isSelected)
        }
    }
    
}

// MARK: -
// MARK: - Configure

private extension PremiumCollectionViewCell {
    
    func configure() {
        configureViews()
    }
    
    func configureViews() {
        backgroundContainerView.layer.cornerRadius = 16
        backgroundContainerView.layer.borderWidth = 1
    }
    
    func selectProduct(isSelected: Bool) {
        backgroundContainerView.backgroundColor = isSelected ? AppColor.rose() : AppColor.blackBorder(alpha: 0.1)
        termLabel.textColor = isSelected ? AppColor.white() : AppColor.blackBorder()
        trialLabel.textColor = isSelected ? AppColor.white() : AppColor.blackBorder()
        priceLabel.textColor = isSelected ? AppColor.white() : AppColor.blackBorder()
    }
    
}
