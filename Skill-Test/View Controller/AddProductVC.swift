//
//  AddProductVC.swift
//  Skill-Test
//
//  Created by Oday Dieg on 18/04/2022.
//

import UIKit
import CoreData

class AddProductVC: UIViewController {
    
    @IBOutlet weak var productImageCollectionView: UICollectionView!
    
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productInfoTextField: UITextField!
    
    @IBOutlet weak var mealMainView: UIView!
    @IBOutlet weak var mealLabel: UILabel!
    
    @IBOutlet weak var itemTypMainView: UIView!
    @IBOutlet weak var itemTypeLabel: UILabel!
    @IBOutlet weak var addProductButton: UIButton!
    
    @IBOutlet weak var priceMainView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    
    private var arrayOfTextField:[UITextField]  = []
    private var arrayOfViews:[UIView]           = []
    private var cell:[CellType]                 = []
    private let arrayOfMeal                     = ["breakfast","brunch","elevenses","lunch","tea","supper","dinner","ever Time and Every Day"]
    private let arrayOfItem                     = ["All","Plates","Hot Drinks","Iced Coffee","Hot Coffe","Juice"]
    private let arrayOfPrice                    = ["10","20","30","40","50","60","70","80","90","100"]
    private var currentIndexInMeal              = -1
    private var currentIndexInItem              = -1
    private var currentIndexInPrice             = -1
    
    
    enum CellType {
        case ImageCell
        case PlusImageCell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupButton()
        setupViewAndTextField()

    }
    
    private func setupCollectionView(){
        productImageCollectionView.delegate                                     = self
        productImageCollectionView.dataSource                                   = self
        cell.append(CellType.PlusImageCell)
        productImageCollectionView.register(UINib(nibName: Cell.Addproductimage, bundle: nil), forCellWithReuseIdentifier: Cell.Addproductimage)
        
        productImageCollectionView.register(UINib(nibName: Cell.imageCell, bundle: nil), forCellWithReuseIdentifier: Cell.imageCell)
        
    }
    
    private func setupButton(){
        addProductButton.layer.cornerRadius     = 20
        addProductButton.layer.masksToBounds    = true
        addProductButton.clipsToBounds          = true
    }
    private func setupViewAndTextField(){
    
        arrayOfTextField    = [productInfoTextField,productNameTextField]
        arrayOfViews        = [mealMainView,itemTypMainView,priceMainView]
        
        for everytextField in arrayOfTextField {
            everytextField.layer.cornerRadius       = 10
            everytextField.layer.masksToBounds      = true
            everytextField.clipsToBounds            = true
        }
        for everyView in arrayOfViews {
            everyView.layer.cornerRadius       = 10
            everyView.layer.masksToBounds      = true
            everyView.clipsToBounds            = true
        }
        
    }
    
    @IBAction func mealUpPressed(_ sender: UIButton) {

        if currentIndexInMeal  < arrayOfMeal.count - 1{
            
            currentIndexInMeal += 1
            mealLabel.text          = arrayOfMeal[currentIndexInMeal]
            mealLabel.textColor     = .black
           
        }
    }
    
    @IBAction func mealdownPressed(_ sender: Any) {
        
        if currentIndexInMeal > 0 {
        currentIndexInMeal -= 1
        self.mealLabel.text          = arrayOfMeal[currentIndexInMeal]
        }
        
    }
    
    @IBAction func itemTypeUpPressed(_ sender: Any) {
        
        if currentIndexInItem  < arrayOfItem.count - 1{
            
            currentIndexInItem += 1
            itemTypeLabel.text          = arrayOfItem[currentIndexInItem]
            itemTypeLabel.textColor     = .black
        }
    }
    
    @IBAction func itemTypeDownPressed(_ sender: Any) {
        if currentIndexInItem > 0 {
        currentIndexInItem -= 1
        itemTypeLabel.text          = arrayOfItem[currentIndexInItem]
        }
    }
    
    @IBAction func priceUpPressed(_ sender: Any) {
        if currentIndexInPrice  < arrayOfPrice.count - 1{
            
            currentIndexInPrice += 1
            priceLabel.text          = arrayOfPrice[currentIndexInPrice]
            priceLabel.textColor     = .black
        }
    }
    @IBAction func priceDownPressed(_ sender: Any) {
        if currentIndexInPrice > 0 {
        currentIndexInPrice -= 1
        priceLabel.text          = arrayOfPrice[currentIndexInPrice]
        }
    }
    
    @IBAction func addProductButtonPressed(_ sender: UIButton) {
        
        if (productNameTextField.text != "")&&(productInfoTextField.text != "")&&(mealLabel.text != "Meal")&&(itemTypeLabel.text != "item Type")&&(priceLabel.text != "Price"){
            
            let newProduct              = ProductEntity(context: context)
            newProduct.productname      = productNameTextField.text
            newProduct.productInfo      = productInfoTextField.text
            newProduct.meal             = mealLabel.text
            newProduct.itemType         = itemTypeLabel.text
            newProduct.price            = priceLabel.text
            
            do{
               try context.save()
                print("saved")
                
            }catch{
                print("error")
            }
            
            PushViewControler(to: MainViewController(), navigationController: self.navigationController, identifier: StoryBoard.MainVC)
            
        }
    }
    
 
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
 
}



//MARK: - Collection View Setup


extension AddProductVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellType = cell[indexPath.row]
        switch cellType {
        case .PlusImageCell:
            
            guard  let cell = productImageCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.Addproductimage, for: indexPath) as? AddProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            
            return cell
        case .ImageCell:
            
            guard  let cell = productImageCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.imageCell, for: indexPath) as? ImageCellCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.Press_Delete = {
                self.cell.remove(at: indexPath.row)
                self.productImageCollectionView.reloadData()
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 81, height: 81)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let currentSelect = indexPath.row
        let numberOfItems = cell.count - 1
     
        if currentSelect == numberOfItems {
            self.cell.insert(CellType.ImageCell, at: 0)
            self.productImageCollectionView.reloadData()
            
        }
            }
    
}
