//
//  Constants.swift
//  AlamofireTest
//
//  Created by Mohamed Ali on 30/09/2022.
//

import Foundation
import UIKit

struct K {
    // MARK: - Base Url
    static let productUrl = "https://dummyjson.com/products"
    static let cartsUrl = "https://dummyjson.com/carts"
    static let userUrl = "https://dummyjson.com/users"
    static let commentsUrl = "https://dummyjson.com/comments"
    
    
    // MARK: - View Controller ids
    
    static let vcDetailsVCid = String(describing: ProductDetailsVC.self)
    
    
    // MARK: - Collections & Tables id
    
    static let idProductsCollectionCell = String(describing: ProductImageCollectionViewCell.self)
    
    static let idProductsTableCell = String(describing: ProdustsTableViewCell.self)
    
    
    // MARK: - View Controllers id
    
    static let vcIdProductVC = String(describing: ProductsVC.self)
}


struct Typealias {
    
    typealias collectionDelegate = UICollectionViewDelegate & UICollectionViewDelegateFlowLayout & UICollectionViewDataSource
    
    typealias tableDelegate = UITableViewDelegate & UITableViewDataSource
}
