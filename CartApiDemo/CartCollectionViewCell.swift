//
//  CartCollectionViewCell.swift
//  CartApiDemo
//
//  Created by Rachana Pandit on 09/12/22.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblProductTitle:UILabel!
    @IBOutlet weak var lblProductQuantity:UILabel!
    @IBOutlet weak var lblProductPrice:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
