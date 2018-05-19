//
//  File.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/13/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit

struct CustomerRecSheet {
    
    let customerName: String
    let date: Date
    let department: String
    let id: String
    let employeeName: String
    let image: UIImage
    let language: String
    let notes: String?
    let productSku: [URL]?
    let text: String
    
}


// MARK: - JSON Decodable

extension CustomerRecSheet {}


// MARK: - JSON Encodable

extension CustomerRecSheet {}
