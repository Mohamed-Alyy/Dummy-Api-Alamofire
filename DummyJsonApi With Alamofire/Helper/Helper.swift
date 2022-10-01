//
//  Helper.swift
//  DummyJsonApi With Alamofire
//
//  Created by Mohamed Ali on 01/10/2022.
//

import Foundation
import UIKit

struct Helper {
    
    static  func regisetrTableCell(table: UITableView , nibName: String , bundel: Bundle? = nil , identifier: String){
        table.register(UINib(nibName: nibName, bundle: bundel), forCellReuseIdentifier: identifier)
    }
    
    
    static  func regisetrCollectionCell(collection: UICollectionView , nibName: String , bundel: Bundle? = nil , identifier: String){
        collection.register(UINib(nibName: nibName, bundle: bundel), forCellWithReuseIdentifier: identifier)
    }
    
    
    
    // convert url string to image
    
  
    static func imageFromUrlString (image: String , completion:(_ image: UIImage?)-> Void) {
        var photo: UIImage?
        
        if let imageUrl = URL(string: image) {
            do{
                let imgeData =  try Data(contentsOf: imageUrl)
                photo = UIImage(data: imgeData)
            }catch{
                print(error)
            }
            
        }
        completion(photo)
    }
    
    
    
    static func customViews (views: [UIView], cornerRadius: CGFloat?) {
        if cornerRadius != nil {
            for view in views {
                view.layer.cornerRadius = view.layer.frame.height * cornerRadius!
                view.layer.shadowColor =  UIColor.lightGray.cgColor
                view.layer.shadowRadius = CGFloat(3)
                view.layer.shadowOffset = CGSize(width: 0, height: 3)
                view.layer.shadowOpacity = 0.7
            }
           
        } else{
            for view in views {
                view.layer.cornerRadius = view.layer.frame.height * 0.1
                view.layer.shadowColor =  UIColor.lightGray.cgColor
                view.layer.shadowRadius = CGFloat(3)
                view.layer.shadowOffset = CGSize(width: 0, height: 3)
                view.layer.shadowOpacity = 0.7
            }
        }
    }
    
}
