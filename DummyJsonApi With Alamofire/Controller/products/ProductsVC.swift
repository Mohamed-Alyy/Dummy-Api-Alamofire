//
//  ProductsVC.swift
//  DummyJsonApi With Alamofire
//
//  Created by Mohamed Ali on 01/10/2022.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class ProductsVC: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Helper.regisetrTableCell(table: productsTableView, nibName: K.idProductsTableCell, identifier: K.idProductsTableCell)
        productsTableView.delegate=self
        productsTableView.dataSource=self
        
        getProducts { products in
            self.productsArray = products!
            self.productsTableView.reloadData()
        }
    }
        
    func getProducts (completion:@escaping([Product]?)->Void){
            AF.request(K.productUrl).responseJSON { response in
             
                let decoder = JSONDecoder()
                switch response.result{
                    
                case .success(_):
                    
                    do{
                        let data = response.data
                        let jsonData = try JSON(data: data!)
                        let products = jsonData["products"]
                        let product = try decoder.decode([Product].self, from: products.rawData())
                          //  print(product)
                        //self.productsArray = product
                        
                        completion(product)
                    }catch{
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        }
        
 
    
        // MARK: - Properties
    var productsArray = [Product]()
    
    
        // MARK: - Actions
    
    
    
        // MARK: - Functions
        
       
        
    
    
 // Calss end
    
    
}

    // MARK: - Extensions

extension ProductsVC: Typealias.tableDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: K.idProductsTableCell, for: indexPath) as! ProdustsTableViewCell
        let currentProduct = productsArray[indexPath.row]
        
        productCell.titleLBL.text = currentProduct.title
        productCell.brandLBL.text = currentProduct.brand
        productCell.priceLBL.text = "Price : $ \(currentProduct.price)"
        productCell.categoryLBL.text = currentProduct.category
        
        productCell.productImages = currentProduct.images
        
        return productCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsVC = storyboard?.instantiateViewController(withIdentifier: K.vcDetailsVCid) as? ProductDetailsVC {
            let currentProduct = productsArray[indexPath.row]
            detailsVC.productImageArray = currentProduct.images
            detailsVC.productDetails = currentProduct
            detailsVC.navigationItem.title = productsArray[indexPath.row].title
            
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.frame.height / 4
    }
    
    
    
}
