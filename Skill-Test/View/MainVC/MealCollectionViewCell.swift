//
//  MealCollectionViewCell.swift
//  Skill-Test
//
//  Created by Oday Dieg on 19/04/2022.
//

import UIKit

class MealCollectionViewCell: UICollectionViewCell {

   
    @IBOutlet weak var CellView: UIView!
    
    @IBOutlet weak var cellMealLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        SetupcellView()
    }
    
    
    private func SetupcellView(){
        CellView.layer.cornerRadius     = 10
        CellView.layer.masksToBounds    = true
        CellView.clipsToBounds          = true
       
    }

}
