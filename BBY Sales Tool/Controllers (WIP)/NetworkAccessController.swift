//
//  NetworkAccess.swift
//  BBY Sales Tool
//
//  Created by Michael Castillo on 5/17/18.
//  Copyright © 2018 Michael Castillo. All rights reserved.
//

import UIKit
import Alamofire

struct NetworkAccessController {
    
    enum Endpoint: String {
        case firebase = "firebase.com"
        case bestbuy = "bestbuy.com"
        
        init?(index: Int) {
            switch index {
            case 0: self = .firebase
            case 1: self = .bestbuy
            default: return nil
            }
        }
    }
    
    var website: String {
        return Endpoint.init(rawValue: "")!.rawValue
    }
    
    static let shared = NetworkAccessController()
        // TODO: - FIXME!!!!
        let urlString = URL(string: Endpoint(index: 1)!.rawValue)
    
    func getData (completion: (Data?) ) -> Void {
        
        Alamofire.request("https://" + "\(String(describing: urlString))").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func downloadRequest(view: UIView, completion: @escaping (CAAnimation?) -> Void) {
        Alamofire.download("\(String(describing: urlString))").downloadProgress { progress in
            print("Download Progress: \(progress.fractionCompleted)")
        }
            .responseData { response in
                if let data = response.result.value {
                        let image = UIImage(data: data)
                }
                completion(nil)
            
        }
    }
    
    func fetchCRWs(completion: @escaping ([CustomerRecSheet]?) -> Void){
                // TODO: - fix in string
        Alamofire.request("pass in website", method: .get, parameters: ["Customer Rec Sheets": "true"]).validate().responseJSON { response in
            
            guard response.result.isSuccess else {
                print("Error: \(String(describing: response.result.error))")
                completion(nil)
                return
            }
            guard let value = response.result.value as? JSONData,
            let crw = value[Keys.customerRecSheet] as? [JSONData] else {
                    print("Bad data")
                    completion(nil)
                    return
            }
            let crws = try? crw.compactMap(CustomerRecSheet.init)
            completion(crws)
            
        }
    }
    
}
