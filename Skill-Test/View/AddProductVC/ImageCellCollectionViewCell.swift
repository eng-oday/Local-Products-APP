//
//  testCollectionViewCell.swift
//  Skill-Test
//
//  Created by Oday Dieg on 18/04/2022.
//

import UIKit

class ImageCellCollectionViewCell: UICollectionViewCell {
    
    

    @IBOutlet weak var ContainerOfImageView: UIView!
    var Press_Delete : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView(){
        ContainerOfImageView.layer.cornerRadius     = 8
        ContainerOfImageView.layer.maskedCorners    = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
    }

    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        Press_Delete?()
        
    }
}
