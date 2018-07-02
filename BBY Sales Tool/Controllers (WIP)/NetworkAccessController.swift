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
  
   public enum DataType {
    case product(product: Product)
    }
    
   public enum NetworkError {
        case urlCreation(string: String)
    }
    
    static let shared = NetworkAccessController()
    
//    func createURL(with parameters: [String: String]?, from url: URL) -> URL {
//        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
//        components?.queryItems = parameters?.compactMap({ URLQueryItem(name: $0.0, value: $0.1) })
//        guard let url = components?.url else {
//            print("\(NetworkError.urlCreation(string: "\(#file, #line)"))")
//        }
//        return url
//    }
        
    func getData (url: URL, completion: (DataType?) ) -> Void {
        Alamofire.request("\(url)").responseJSON { response in
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
    
    func downloadRequest(view: UIView, urlString: URL, completion: @escaping (CAAnimation?) -> Void) {
        Alamofire.download("\(urlString)").downloadProgress { progress in
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
