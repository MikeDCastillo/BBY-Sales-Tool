//
//  Protocols.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/17/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import Foundation


// MARK: - JSON Helpers


typealias JSONData = [String: Any]

protocol JsonInitializable {
    init(json: JSONData) throws
}

protocol JsonExportable {
    func json() -> JSONData
}

enum JsonErrorType: Error {
    case keyMismatch(String)
    case typeMismatch(String)
}

protocol StringToDateStampable {
    var isoDate: String { get set }
    
}

protocol Nameable {}
extension Nameable {
    static var name: String {
        return String(describing: Self.self)
    }
}
