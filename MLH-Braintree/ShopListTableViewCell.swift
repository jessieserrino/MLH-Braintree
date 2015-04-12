//
//  ShopListTableViewCell.swift
//  MLH-Braintree
//
//  Created by Jessie Serrino on 4/11/15.
//  Copyright (c) 2015 Jessie Serrino. All rights reserved.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    @IBOutlet var itemImageView: UIImageView!
    
    @IBOutlet var itemNameLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.itemNameLabel.text = "YES"
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        self.itemImageView.layer.cornerRadius = self.itemImageView.frame.size.width / 2
        
        self.itemImageView.layer.masksToBounds = true
        

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
