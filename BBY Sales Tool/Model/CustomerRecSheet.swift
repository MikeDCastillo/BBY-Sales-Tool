//
//  File.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/13/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//


        // TODO: - check if id property should be UUID
import UIKit

struct CustomerRecSheet {
    
    let customerName: String
    let date: Date
    let department: String
    let employeeName: String
    let id: String
    let imageURL: URL
    let language: String
    let notes: String?
    let productSkus: [URL]?
    let text: String
    
    /// Default Initializer for Save / Share feature
    ///
    /// - Parameters: used for saving into database upon new CRW creation
    init(customerName: String, date: Date = Date(), department: String, employeeName: String, id: String, imageURL: URL, language: String, notes: String, productSku: [URL]?, text: String) {
        
        self.customerName = customerName
        self.department = department
        self.date = date
        self.employeeName = employeeName
        self.id = id
        self.imageURL = imageURL
        self.language = language
        self.notes = notes
        self.productSkus = productSku
        self.text = text
        
    }
    
}


// MARK: - JSON Exportable

extension CustomerRecSheet: JsonExportable {
    
    func json() -> JSONData {
        var dictionary = [String: Any]()
        dictionary[Keys.customerName] = customerName
        dictionary[Keys.date] = date
        dictionary[Keys.department] = department
        dictionary[Keys.employeeName] = employeeName
        dictionary[Keys.id] = id
        dictionary[Keys.imageURL] = imageURL
        dictionary[Keys.language] = language
        dictionary[Keys.notes] = notes
        dictionary[Keys.productSku] = productSkus
        dictionary[Keys.text] = text
        print(dictionary.values)
        
        return dictionary
    }
    
}


// MARK: - JSON Initializable

extension CustomerRecSheet: JsonInitializable {
    
    init(json: [String: Any]) throws {
        guard let customerName = json[Keys.customerName] as? String else { throw JsonErrorType.keyMismatch("\(Keys.customerName)")}
        guard let dateString = json[Keys.date] as? String else { throw JsonErrorType.typeMismatch("\(Keys.date)") }
        let date = dateString.stringToDate(dateString)
        guard let department = json[Keys.department] as? String else { throw JsonErrorType.keyMismatch("\(Keys.department)") }
        guard let employeeName = json[Keys.employeeName] as? String else {
            throw JsonErrorType.keyMismatch("\(Keys.employeeName)")
        }
        guard let id = json[Keys.id] as? String else {
            throw JsonErrorType.keyMismatch("\(Keys.id)")
        }
        guard let imageURLString = json[Keys.imageURL] as? String else {
           throw JsonErrorType.typeMismatch("\(Keys.imageURL)")
        }
        guard let imageURL = URL(string: imageURLString) else {
            throw JsonErrorType.typeMismatch("\(Keys.imageURL)")
        }
        guard let language = json[Keys.language] as? String else {
            throw JsonErrorType.keyMismatch("\(Keys.language)")
        }
        guard let notes = json[Keys.notes] as? String else {
            throw JsonErrorType.keyMismatch("\(Keys.notes)")
        }
        guard let productSkus = json[Keys.productSku] as? [URL] else {
            throw JsonErrorType.typeMismatch("\(Keys.productSku)")
        }
        guard let text = json[Keys.text] as? String else {
           throw JsonErrorType.keyMismatch("\(Keys.text)")
        }
        
        self.customerName = customerName
        self.date = date
        self.department = department
        self.employeeName = employeeName
        self.id = id
        self.imageURL = imageURL
        self.language = language
        self.notes = notes
        self.productSkus = productSkus
        self.text = text
    }
    
}






