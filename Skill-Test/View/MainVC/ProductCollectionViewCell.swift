//
//  ProductCollectionViewCell.swift
//  Skill-Test
//
//  Created by Oday Dieg on 19/04/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
   

    @IBOutlet weak var ContainerView: UIView!
    @IBOutlet weak var imageView: UIView!
    
    @IBOutlet weak var producNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var arrayOfView:[UIView] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        SetupViews()
    }
    
    private func SetupViews(){
        
        arrayOfView = [contentView,imageView]
        
        for eachView in arrayOfView {
            
            eachView.layer.cornerRadius     = 20
            eachView.layer.masksToBounds    = true
            eachView.clipsToBounds          = true
        }
        
    }

}
