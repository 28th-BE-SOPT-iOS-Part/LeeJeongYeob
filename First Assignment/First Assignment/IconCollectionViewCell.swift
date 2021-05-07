//
//  IconCollectionViewCell.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/07.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initializeValue(_ title: String) {
        iconTitleLabel.text = title
    }
}
