//
//  MainViewController.swift
//  Skill-Test
//
//  Created by Oday Dieg on 19/04/2022.
//

import UIKit
import CoreData

class MainViewController: UIViewController {

    @IBOutlet weak var mealCollectionView: UICollectionView!
    @IBOutlet weak var itemTypeCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var arrayOfCollections:[UICollectionView]       = []
    var SelectedIndexInMeal                         = 0
    var SelectedIndexInItemType                     = 0
    var DataFetched:[ProductEntity]                 = []

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupCollections()
       // deleteAll()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadProducts()
    }
    
    // to load data
   private  func loadProducts ()
    {
        let request : NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        do{
          DataFetched = try context.fetch(request)
        }
        catch
        {
            print("error In Load Data")
        }
    }
    
    // To delete Entity And Her Data
    func deleteAll(){
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: CoreDataModel.productEntity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
        } catch _ as NSError {
            //  handle the error
        }
    }

    
    private func SetupCollections(){
        
        arrayOfCollections = [mealCollectionView,itemTypeCollectionView,productCollectionView]
        
        for collectioN in arrayOfCollections {
            collectioN.delegate     = self
            collectioN.dataSource   = self
        }
        
        mealCollectionView.register(UINib(nibName: Cell.meal, bundle: nil), forCellWithReuseIdentifier: Cell.meal)
        itemTypeCollectionView.register(UINib(nibName: Cell.mainCell, bundle: nil), forCellWithReuseIdentifier: Cell.mainCell)
        productCollectionView.register(UINib(nibName: Cell.product, bundle: nil), forCellWithReuseIdentifier: Cell.product)
        
        
        
    }
    
    

}

extension MainViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return DataFetched.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //first Collection
        if collectionView == mealCollectionView{
            
            guard let cell = mealCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.meal, for: indexPath) as? MealCollectionViewCell else {return UICollectionViewCell()}
            
            let meal = DataFetched[indexPath.row].meal
            cell.cellMealLabel.text                         = meal
            
            if indexPath.row == SelectedIndexInMeal {
                cell.CellView.backgroundColor               = UIColor(displayP3Red: 252/255, green: 107/255, blue: 104/255, alpha: 1)
                cell.cellMealLabel.textColor                = .white
            }else {
                cell.CellView.backgroundColor               = .white
                cell.cellMealLabel.textColor                = .black
            }
            return cell
            
        }
        //Second Collection
        else if collectionView == itemTypeCollectionView{
            guard let cell = itemTypeCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.mainCell, for: indexPath) as? MainItemTypeCell else{return UICollectionViewCell()}
           
            let item                                        = DataFetched[indexPath.row].itemType
            cell.ItemTypeLabel.text                         = item
            if indexPath.row == SelectedIndexInItemType{
                cell.ItemTypeLabel.textColor                = .black
                
            }else{
                cell.ItemTypeLabel.textColor                = .lightGray
                
            }
            
            return cell
        }
        //Third Collection
        else{
            
            guard let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: Cell.product, for: indexPath) as? ProductCollectionViewCell else{return UICollectionViewCell()}
           
            let productName                 = DataFetched[indexPath.row].productname
            let price                       = DataFetched[indexPath.row].price
            
            cell.producNameLabel.text       = productName
            cell.priceLabel.text            = price

            return cell
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mealCollectionView{
            
            SelectedIndexInMeal = indexPath.row
            mealCollectionView.reloadData()
        }else{
            SelectedIndexInItemType = indexPath.row
            itemTypeCollectionView.reloadData()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == productCollectionView{
            let width:CGFloat       = (collectionView.frame.size.width / 2) - 11
            let height:CGFloat      = 247

            return CGSize(width: width, height: height)
        }
        else{
            return collectionView.frame.size
        }
    }

    
    
}
