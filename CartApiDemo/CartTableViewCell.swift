//
//  CartTableViewCell.swift
//  CartApiDemo
//
//  Created by Rachana Pandit on 09/12/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {
 
@IBOutlet weak var lblCartId:UILabel!
@IBOutlet weak var lblTotalProducts:UILabel!
@IBOutlet weak var collView:UICollectionView!
 
    var arrayProduct  = [[String:Any]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        registerCollXib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
        
    func registerCollXib()
    {
      let nibName = UINib(nibName: "CartCollectionViewCell", bundle: nil)
        
        collView.register(nibName, forCellWithReuseIdentifier: "CartCollectionViewCell")
    }
    
}

extension CartTableViewCell:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let collCell =  collView.dequeueReusableCell(withReuseIdentifier:"CartCollectionViewCell", for: indexPath) as! CartCollectionViewCell
        
        collCell.lblProductTitle.text = arrayProduct[indexPath.row]["title"] as? String
        collCell.lblProductPrice.text = String(arrayProduct[indexPath.row]["price"] as! Int)
        collCell.lblProductQuantity.text = String(arrayProduct[indexPath.row]["quantity"] as! Int)
        return collCell
    }
}

extension CartTableViewCell:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collView.frame.width/CGFloat(arrayProduct.count)), height: 120.0)
    }
}
