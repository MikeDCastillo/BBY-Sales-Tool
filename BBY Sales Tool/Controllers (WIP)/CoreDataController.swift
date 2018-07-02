//
//  CoreDataController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/31/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit

struct CoreDataController {
    
    func saveContext() {
        var context = CoreDataStack.context
        
        if context.hasChanges {
            do {
                try context.save()
            } catch{
                let error = error as Error
                print(String(describing: "\(error)"))
            }
        }
    }
    
}
