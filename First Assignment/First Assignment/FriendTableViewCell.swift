//
//  FriendTableViewCell.swift
//  First Assignment
//
//  Created by 이정엽 on 2021/05/07.
//

import UIKit

class FriendTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initializeData(_ image: UIImage, _ name: String, _ status: String) {
        profileImageView.image = image
        nameLabel.text = name
        statusLabel.text = status
    }
}
