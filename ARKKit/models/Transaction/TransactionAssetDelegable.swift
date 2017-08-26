//
//  TransactionAssetDelegable.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol TransactionAssetDelegable {}

extension TransactionAssetDelegable {
    
    static public func from(entry: NSDictionary) -> TransactionAsset.Delegate {
        typealias transactionKeys = Defaults.Keys.Transactions
        var delegate = TransactionAsset.Delegate()
        for asset in entry where (asset.key as! String) == transactionKeys.Assets.delegate {
            for item in (asset.value as! NSDictionary) {
                switch String(describing: item.key) {
                case transactionKeys.Assets.username: delegate.username = String(describing: item.value)
                case transactionKeys.Assets.publicKey: delegate.publicKey = String(describing: item.value)
                default: break
                }
            }
        }
        return delegate
    }
    
}
