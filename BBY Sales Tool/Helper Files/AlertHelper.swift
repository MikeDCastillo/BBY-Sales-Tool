//
//  AlertHelper.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 6/21/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static let shared = UIAlertController()
    
    /// creates an alertController that gets presented on a view
    ///
    /// - Parameters:
    ///   - view: The desired view to present on
    ///   - title: the main message on the top of the AlertController to present
    ///   - msg: the clickable action at the bottom of the alert
    func presentAlertControllerForError(on view: UIViewController, title: String?, msg: String?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}
