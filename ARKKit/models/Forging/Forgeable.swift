//
//  Forgeable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Forgeable {}

extension Forgeable {
    
    static public func from(_ publicKey: String, on networkType: NetworkType) -> Forging {
        typealias forgeKeys = Defaults.Keys.Forging
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Forging.forgingWithPublicKey + publicKey
        let urlString = node.url! + path
        var forging = Forging()
        API.processObject(urlString: urlString) { result in
            for entry in (result) {
                switch String(describing: entry.key) {
                    case forgeKeys.fees: forging.fees = Int64(entry.value as! String)
                    case forgeKeys.rewards: forging.rewards = Int64(entry.value as! String)
                    case forgeKeys.forged: forging.forged = Int64(entry.value as! String)
                default: break
                }
            }
        }
        return forging
    }
    
}
