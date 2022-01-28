//
//  LibrarySecureFloderCollectionViewCell.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

class LibrarySecureFloderCollectionViewCell: UICollectionViewCell {
    
    // - UI
    @IBOutlet weak var floderNameLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}

// MARK: -
// MARK: - Configure

private extension LibrarySecureFloderCollectionViewCell {
    
    func configure() {
        configureMainView()
    }
    
    func configureMainView() {
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = AppColor.blackBorder(alpha: 0.1).cgColor
    }
    
}
