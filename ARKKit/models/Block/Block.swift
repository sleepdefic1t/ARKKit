//
//  Block.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Block: Blockable {
    public var
        id: String!,
        version: Int64!,
        timestamp: Int64!,
        height: Int64!,
        previousBlock: String!,
        numberOfTransactions: Int64!,
        totalAmount: Int64!,
        totalFee: Int64!,
        reward: Int64!,
        payloadLength: Int64!,
        payloadHash: String!,
        generatorPublicKey: String!,
        generatorId: String!,
        blockSignature: String!,
        confirmations: Int64!,
        totalForged: Int64!
}
