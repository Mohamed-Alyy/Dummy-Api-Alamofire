//
//  ProdustsTableViewCell.swift
//  DummyJsonApi With Alamofire
//
//  Created by Mohamed Ali on 01/10/2022.
//

import UIKit
import Kingfisher


class ProdustsTableViewCell: UITableViewCell {
    
    // MARK: - Oultes
    
    
    @IBOutlet weak var imageBackView: UIView!
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var productCollection: UICollectionView!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var brandLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    @IBOutlet weak var categoryLBL: UILabel!
    
    
    override func layoutSubviews() {
        Helper.customViews(views: [productCollection , backView, imageBackView], cornerRadius: 0.05)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Helper.regisetrCollectionCell(collection: productCollection, nibName: K.idProductsCollectionCell, identifier: K.idProductsCollectionCell)
        productCollection.delegate=self
        productCollection.dataSource=self
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    // MARK: - Properties
    
    var productImages : [String] = []
    
    
}

extension ProdustsTableViewCell: Typealias.collectionDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cellImage = collectionView.dequeueReusableCell(withReuseIdentifier: K.idProductsCollectionCell, for: indexPath) as? ProductImageCollectionViewCell {
            if let images = URL(string: productImages[indexPath.row]) {
                cellImage.productImge.kf.setImage(
                    with: images,
                    
                    options: [
                        .loadDiskFileSynchronously,
                        .cacheOriginalImage,
                        .transition(.fade(0.25)),
                        
                    ]
                )
            }
           
                
           
            return cellImage
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
}
