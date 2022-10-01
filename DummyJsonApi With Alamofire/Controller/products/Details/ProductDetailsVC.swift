//
//  ProductDetailsVC.swift
//  DummyJsonApi With Alamofire
//
//  Created by Mohamed Ali on 01/10/2022.
//

import UIKit
import Kingfisher

class ProductDetailsVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var productImagesCollection: UICollectionView!
    
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var detailsBackView: UIView!
    
    @IBOutlet weak var descriptionLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var discountLBL: UILabel!
    @IBOutlet weak var brandLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.customViews(views: [imageBackView,detailsBackView], cornerRadius: 0.05)
        Helper.regisetrCollectionCell(collection: productImagesCollection, nibName: K.idProductsCollectionCell, identifier: K.idProductsCollectionCell)
        productImagesCollection.delegate=self
        productImagesCollection.dataSource=self

        // Do any additional setup after loading the view.
    }
    
    var productDetails : Product?
    var productImageArray = [String]()

    // MARK: - Functions
    
   

}


extension ProductDetailsVC: Typealias.collectionDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.idProductsCollectionCell, for: indexPath) as? ProductImageCollectionViewCell {
           
            descriptionLBL.text = productDetails?.productDescription
            priceLBL.text = "$ \(productDetails!.price)"
            discountLBL.text = "% \(productDetails!.discountPercentage)"
            brandLBL.text = productDetails?.brand
            
            
            let images = URL(string: (productDetails?.images[indexPath.row])!)
            
            if images != nil {
                cell.productImge.kf.setImage(
                    with: images,
                    
                    options: [
                        .loadDiskFileSynchronously,
                        .cacheOriginalImage,
                        .transition(.fade(0.25)),
                        
                    ]
                )
                }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    
    
}
