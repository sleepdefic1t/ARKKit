//
//  API.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public enum API {

    static public func processObject(urlString: String, completion: @escaping (_ result: NSDictionary)  -> Void) {
        if let url = URL(string: (urlString)) {
            do {
                let string = try NSString(contentsOf: url, encoding: String.Encoding.utf8.rawValue)
                if let data = string.data(using: String.Encoding.utf8.rawValue) {
                    do {
                        let jsonObject = try (JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary)!
                        completion(jsonObject)
                    } catch { print(error.localizedDescription) }
                }
            }  catch { print(error.localizedDescription) }
        }
    }
    
}
