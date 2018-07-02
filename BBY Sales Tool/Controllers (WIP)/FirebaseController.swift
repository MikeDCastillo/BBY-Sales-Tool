//
//  FirebaseController.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/17/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

struct FirebaseController {
    
    static let shared = FirebaseController()
    fileprivate var customerRecSheet = [CustomerRecSheet]()
    let rootRef = Database.database().reference()

    
    /// Saves at DatabaseReference
    ///
    /// - Parameters:
    ///   - ref: DatabaseReference
    ///   - json: [String: Any]
    func save(at ref: DatabaseReference, json: JSONData) {
        rootRef.setValue(json) { (error, ref) in
            print("error \(#file) \(#line)")
        }
    }
    
    func getData(with query: DatabaseQuery, completion: ((JSONData) -> Void)?) {
        query.observeSingleEvent(of: .value, with: { snapshot in
            if let snap = snapshot.value as? JSONData, snapshot.exists() {
                completion?(snap)
            } else {
                print("\(String(describing: snapshot.value))" + "\(#line)")
                completion?(snapshot.value as? JSONData ?? [:])
            }
        })
    }
    
    func sortByDate(crw: [CustomerRecSheet]) {}

    func delete(at ref: DatabaseReference, completion: ((Error?) -> Void)?) {
        ref.removeValue { error, ref in
            completion?(error)
        }
    }
}

/*
 
 REFS
 child(String) - new reference one level deeper with that child name
 childByAutoId -> New reference with auto generated key
 
 CREATE/UPDATE
 setValue -> Saves and OVERRIDES data at the reference including all child values.
 updateChildValues -> UPDATES the data at the ref without overriding existing data or child values
 
 DELETE
 removeValue -> Deletes everything
 
 SUBSCRIPTION
 observeValue(completion (FIRDataSnapshot))
 
 
 */
