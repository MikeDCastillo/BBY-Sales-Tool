//
//  Product.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 6/8/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import Foundation

struct Product {
    
    let color: String?
    let mobileURL: String
    let modelNumber: String
    let name: String
    let UPC: String
    let sku: String
    
}

extension Product: JsonInitializable {
    
    /// Initializes Product from dictionary format
    ///
    /// - Parameter json: [String: Any]
    /// - Throws: jsonErrorType
    init(json: JSONData) throws {
        guard let color = json[Keys.color] as? String else {
            throw JsonErrorType.typeMismatch("color") }
        guard let mobileURL = json[Keys.mobileURL] as? String else { throw JsonErrorType.typeMismatch("mobileURL") }
        guard let modelNumber = json[Keys.modelNumber] as? String else {
            throw JsonErrorType.typeMismatch("modelNumber")
        }
        guard let name = json[Keys.name] as? String else {
            throw JsonErrorType.typeMismatch("name")
        }
        guard let UPC = json[Keys.UPC] as? String else {
            throw JsonErrorType.typeMismatch("upc")
        }
        guard let sku = json[Keys.sku] as? String else {
            throw JsonErrorType.typeMismatch("sku")
        }
        
        self.color = color
        self.mobileURL = mobileURL
        self.modelNumber = modelNumber
        self.name = name
        self.UPC = UPC
        self.sku = sku
    }
    
}


extension Product: JsonExportable {
    
    func json() -> JSONData {
        var dictionary = JSONData()
        dictionary[Keys.color] = color
        dictionary[Keys.mobileURL] = mobileURL
        dictionary[Keys.modelNumber] = modelNumber
        dictionary[Keys.name] = name
        dictionary[Keys.UPC] = UPC
        dictionary[Keys.sku] = sku
        return dictionary
    }
    
}
