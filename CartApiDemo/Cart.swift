//
//  Cart.swift
//  CartApiDemo
//
//  Created by Rachana Pandit on 09/12/22.
//

import Foundation

struct Response{
    var cart:[Cart]
    var total:Int
    var skip:Int
    var limit:Int
}

struct Cart{
    var id:Int
    var product:[[String:Any]]
    var total:Int
    var discountedTotal:Int
    var userId:Int
    var totalProducts:Int
    var totalQuantity:Int
}

struct Product{
    var productId:Int
    var productTitle:String
    var producrPrice:Int
    var productQuantity:Int
    var productTotalPrice:Int
    var discountPercentage:Double
    var discountedPrice:Double
}
