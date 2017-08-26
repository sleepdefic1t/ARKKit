//
//  Account.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Account: Accountable {
    public var
        username: String?,
        address: String!,
        balance: Int64!,
        unconfirmedBalance: Int64!,
        publicKey: String!,
        unconfirmedSignature: String?,
        secondSignature: String?,
        secondPublicKey: String?,
        multisignatures: [String]?,
        unconfirmedMultisignatures: [String]?
}
