//
//  ProductImageCollectionViewCell.swift
//  DummyJsonApi With Alamofire
//
//  Created by Mohamed Ali on 01/10/2022.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var productImge: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func layoutSubviews() {
//        Helper.customViews(views: [backView], cornerRadius: 0.05)
    }
    // MARK: - Properties
    
    
}
