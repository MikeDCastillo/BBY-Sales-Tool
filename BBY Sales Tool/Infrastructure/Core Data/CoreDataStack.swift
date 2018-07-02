//
//  File.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/31/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit
import CoreData

enum CoreDataStack {
    
    static var context: NSManagedObjectContext {
        return container.viewContext
    }
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BBY Sales Tool")
        container.loadPersistentStores(completionHandler: {(NSPersistentStoreDescription, error) in
            if let error = error {
                fatalError("Error loading persistent stores: \(error)")
            }
        })
        return container
    }()
    
}
