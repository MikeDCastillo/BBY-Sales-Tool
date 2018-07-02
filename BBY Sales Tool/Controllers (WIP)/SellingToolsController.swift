//
//  SellingToolsController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 6/19/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit

struct SellingToolController {
    
    static let shared = SellingToolController()
    
    /// static data array of selling tools. TODO: add in detail Images
    var sellingTools: [SellingTool] {
        
        let geekSquadProtection = SellingTool(description: "Geek Squad Plans", cellImage: UIImage(named: Keys.gsp), detailImage: nil)
        let totalTechSupport = SellingTool(description: "Total Tech Support", cellImage: UIImage(named: Keys.totalTechSupport), detailImage: nil)
        let brandedPayment = SellingTool(description: "Branded Payment", cellImage: UIImage(named: Keys.brandedPayment), detailImage: nil)
        let apple = SellingTool(description: "Apple", cellImage: UIImage(named: Keys.apple), detailImage: UIImage(named: Keys.appleDeductible))
        let productSearch = SellingTool(description: "Products", cellImage: UIImage(named: Keys.products), detailImage: nil)
        let contactDeveloper = SellingTool(description: "Contact the Developer", cellImage: UIImage(named: Keys.legoStarWars), detailImage: nil)
        
        return [geekSquadProtection, totalTechSupport, brandedPayment, apple, productSearch, contactDeveloper]
    }
    
}
