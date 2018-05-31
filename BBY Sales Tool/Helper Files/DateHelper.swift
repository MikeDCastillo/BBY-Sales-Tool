//
//  DateHelper.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/23/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import Foundation

extension String {

    var dateFormatter: DateFormatter {
        return DateFormatter()
    }
    
    /// Converts TimeInterval to String formatted as MM-D-YYYY
    ///
    /// - Parameters:
    ///   - timeInterval: timeIntervalSince1970
    func timeIntervalToString(_ timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        // set up US English Locale
        dateFormatter.locale = Locale(identifier: "en_US")
        print(dateFormatter.string(from: date)) // MM-dd-yyyy
        let stringDate =  dateFormatter.string(from: date)
        return stringDate
    }
    
    func stringToDate(_ string: String) -> Date {
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MM-dd-yyyy"
        print(dateFormatter.dateFormat)
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter.date(from: string)!
    }
    
    func dateToString(_ date: Date) -> String {
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let dateFromString = dateFormatter.string(from: date)
        return dateFromString
    }
    
}
