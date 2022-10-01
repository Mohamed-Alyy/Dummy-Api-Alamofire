//
//  ProductModel.swift
//  AlamofireTest
//
//  Created by Mohamed Ali on 30/09/2022.
//

import Foundation

//struct Carts : Codable{
//    let id : Int
//    let products: [CartProducts]
//    let total: Int
//    let skip: Int
//    let  limit: Int
//}
//
//struct CartProducts: Codable {
//    let id: Int
//    let title: String
//    let price: Int
//    let quantity: Int
//    let total: Int
//    let discountPercentage : Double
//    let discountedPrice: Double
//
//}

// MARK: - Carts
struct Carts: Codable {
    
    let total, skip, limit: Int
    let carts: [Cart]
}

// MARK: - Cart
struct Cart: Codable {
    let id , totalQuantity: Int
    let total, discountedTotal, userID, totalProducts: Int
    let products: [CartsProduct]
    
    

    enum CodingKeys: String, CodingKey {
        case id, products, total, discountedTotal
        case userID = "userId"
        case totalProducts, totalQuantity
    }
}

// MARK: - Product
struct CartsProduct: Codable {
    let id: Int
    let title: String
    let price, quantity, total: Int
    let discountPercentage: Double
    let discountedPrice: Int
}


