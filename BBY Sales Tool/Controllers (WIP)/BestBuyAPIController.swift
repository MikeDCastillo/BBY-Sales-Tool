//
//  BestBuyAPIController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/22/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//
//https://bestbuyapis.github.io/api-documentation/#overview
//http://bestbuyapis.github.io/bby-query-builder/#/productSearch

import UIKit
import Alamofire

struct BestBuyAPIController {
    
    static let shared = BestBuyAPIController()
    var products: [Product] = []
    
    enum NetworkError {
        case urlCreation(string: String)
    }
    enum Endpoint {
        /// https://api.bestbuy.com/v1/products?apiKey=hs7wzhcuneegenpnkxq97rns&sort=sku.asc&show=sku,upc,name,modelNumber,color,mobileUrl&format=json
        /// https://developer.bestbuy.com/secure/dashboard
        
        static let urlString = "https://api.bestbuy.com/v1/products"
        static let sortOptions = "sku.asc" //&sort=sku.asc
        static let showOptions = "sku,upc,name,modelNumber,color,mobileUrl" //&show=sku,upc,name,modelNumber,color,mobileUrl
        static let responseFormat = "json" //&format=json
        /// Application: TestRESTAPI_50
        static let tempAPIKeyThatINeedToFix = "sp7z8r5rmffxrjjw6rpjjz85"
    }
    
    func searchForProduct(with searchTerm: String) -> String {
        return searchTerm
    }
    
    mutating func getProductData() -> [Product]? {
        var products: [Product] = []
        
        guard let url = URL(string: "https://api.bestbuy.com/v1/products((search=\(String(describing: getProductData())))?apiKey=sp7z8r5rmffxrjjw6rpjjz85&sort=upc.asc&show=upc,sku,name,color,mobileUrl,modelNumber&pageSize=15&format=json") else {
            print("\(NetworkError.urlCreation(string: "\(#file,#line)"))");
            return nil
        }
        
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            if var productJSON = response.result.value {
                guard let productObjects = productJSON as? [JSONData] else { return }
                var products = productObjects.compactMap {try? Product(json: $0) }
                print("you need to finish this function dummy ")
                print("\(#file, #line)")
            }
        }
        print("Loading Web service")
        return products
    }
    
}

