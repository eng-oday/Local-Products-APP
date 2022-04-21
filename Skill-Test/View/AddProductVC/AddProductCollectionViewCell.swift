//
//  AddProductCollectionViewCell.swift
//  Skill-Test
//
//  Created by Oday Dieg on 18/04/2022.
//

import UIKit

class AddProductCollectionViewCell: UICollectionViewCell {
    
    

    @IBOutlet weak var PlusButtonView: UIView!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupView()
    }
    
    private func setupView(){
        PlusButtonView.layer.cornerRadius     = 8
        PlusButtonView.layer.masksToBounds    = true
        PlusButtonView.clipsToBounds          = true
    }

}
