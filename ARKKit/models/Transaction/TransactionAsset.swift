//
//  TransactionAsset.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct TransactionAsset {
    public struct Delegate: TransactionAssetDelegable {
        public var
            username: String!,
            publicKey: String!
    }
}
