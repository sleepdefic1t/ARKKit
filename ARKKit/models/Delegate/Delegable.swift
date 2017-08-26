//
//  Delegable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Delegable {}

extension Delegable {
    
    static public func all(on networkType: NetworkType) -> [Delegate] {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Delegates.delegates
        let urlString = node.url! + path
        var arkDelegates: [Delegate] = []
        API.processObject(urlString: urlString) { result in
            for delegates in result where delegates.key as! String == Defaults.Keys.Delegate.delegatesKey {
                for entry in delegates.value as! NSArray {
                    let arkDelegate: Delegate = Delegate.iteratedDelegateResults(in: entry as! NSDictionary)
                    arkDelegates.append(arkDelegate)
                }
            }
        }
        return arkDelegates
    }
    
    static public func with(username: String, on networkType: NetworkType) -> Delegate {
        var arkDelegate = Delegate()
        for delegate in all(on: networkType) where delegate.username == username {
            arkDelegate = delegate
        }
        return arkDelegate
    }
    
    static public func fee(on networkType: NetworkType) -> Int {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Delegates.delegatesFee
        let urlString = node.url! + path
        var arkFee: Int = 0
        API.processObject(urlString: urlString) { result in
            for cost in result where cost.key as! String == Defaults.Keys.Delegate.delegatesFee {
                arkFee = cost.value as! Int
            }
        }
        return arkFee
    }
    
    fileprivate static func iteratedDelegateResults(in dictionary: NSDictionary) -> Delegate {
        typealias delegateKeys = Defaults.Keys.Delegate
        var arkDelegate = Delegate()
        for entry in dictionary {
            switch String(describing: entry.key) {
                case delegateKeys.username: arkDelegate.username = String(describing: entry.value)
                case delegateKeys.address: arkDelegate.address = String(describing: entry.value)
                case delegateKeys.publicKey: arkDelegate.publicKey = String(describing: entry.value)
                case delegateKeys.vote: arkDelegate.vote = String(describing: entry.value)
                case delegateKeys.producedBlocks: arkDelegate.producedBlocks = entry.value as! Int64
                case delegateKeys.missedBlocks: arkDelegate.missedBlocks = entry.value as! Int64
                case delegateKeys.rate: arkDelegate.rate = entry.value as! Int64
                case delegateKeys.productivity: arkDelegate.productivity = entry.value as! Double
                case delegateKeys.approval: arkDelegate.approval = entry.value as! Double
            default: break
            }
        }
        return arkDelegate
    }
    
}
