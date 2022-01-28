//
//  LibraryFloderCollectionViewCell.swift
//  ScanFax
//
//  Created by Archi Morandini on 27.01.2022.
//

import UIKit

class LibraryFloderCollectionViewCell: UICollectionViewCell {
    
    // - UI
    @IBOutlet weak var emptyFloderView: UIView!
    @IBOutlet weak var countFileLabel: UILabel!
    @IBOutlet weak var floderNameLabel: UILabel!
    @IBOutlet var fileImageViews: [UIImageView]!
    @IBOutlet weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
}

// MARK: -
// MARK: - Configure

private extension LibraryFloderCollectionViewCell {
    
    func configure() {
        configureMainView()
    }
    
    func configureMainView() {
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = AppColor.blackBorder(alpha: 0.1).cgColor
    }
    
}
