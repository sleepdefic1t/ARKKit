//
//  Accountable.swift
//  ARKKit
//

//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Accountable {}

extension Accountable {
    
    static public func with(address: String, on networkType: NetworkType) -> Account {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Account.accountWithAddress + address
        let urlString = node.url! + path
        var account = Account()
        API.processObject(urlString: urlString) { result in
            for item in result where (item.key as! String == Defaults.Keys.Account.accountKey) {
                account = iteratedAccountResults(in: item.value as! NSDictionary)
            }
        }
        return account
    }
    
    fileprivate static func iteratedAccountResults(in dictionary: NSDictionary) -> Account {
        typealias accountKeys = Defaults.Keys.Account
        var account = Account()
        for entry in dictionary {
            switch String(describing: entry.key) {
                case accountKeys.address: account.address = entry.value as! String
                case accountKeys.balance: account.balance = Int64(entry.value as! String)
                case accountKeys.multisignatures: account.multisignatures = entry.value as? [String]
                case accountKeys.publicKey: account.publicKey = entry.value as! String
                case accountKeys.secondPublicKey: account.secondPublicKey = entry.value as? String
                case accountKeys.secondSignature: account.secondSignature = entry.value as? String
                case accountKeys.unconfirmedMultisignatures: account.unconfirmedMultisignatures = entry.value as? [String]
                case accountKeys.unconfirmedBalance: account.unconfirmedBalance = Int64(entry.value as! String)
                case accountKeys.unconfirmedSignature: account.unconfirmedSignature = entry.value as? String
            default: break
            }
        }
        return account
    }
    
}
