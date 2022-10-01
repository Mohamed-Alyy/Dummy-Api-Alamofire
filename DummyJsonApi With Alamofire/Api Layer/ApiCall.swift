//
//  ApiCall.swift
//  AlamofireTest
//
//  Created by Mohamed Ali on 30/09/2022.
//

import Foundation
import Alamofire
import SwiftyJSON


struct ApiCall {
    
    
    static func fetchDataFromApi <T: Codable> (url: String , completion: @escaping(T?,Error?)-> Void){
        AF.request(url).responseJSON { response in
            let result = response.result
            switch result{
                
            case .success(_):
              
                
                do{
                    let jsonData = try JSON(data: response.data!)
//                    let data = jsonData["carts"]
//                   // print(jsonData)
                    let mydata = try JSONDecoder().decode(T.self, from: jsonData.rawData())
                   // print(mydata)
                    completion(mydata,nil)
                }catch{
                   print(error)
                    completion(nil,error)
                }
            case .failure(let error):
                completion(nil,error)
              //  print("Failuer", error.localizedDescription)
            }
        }
    }
}
