//
//  Transaction.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Transaction: Transactionable {
    public var
        id: String!,                             // Transaction ID.
        blockID: String!,                        // ID of Transactions' Block
        type: Int!,                              // 0 = Normal transaction.
        timestamp: Int!,                         // Based on UTC time of genesis since epoch.
        amount: Int!,                            // The amount to send expressed as an integer value.
        fee: Int!,                               // 0.1 ARK expressed as an integer value.
        senderID: String!,                       // Sender ID/Ark Address
        recipientID: String!,                    // Recipient ID.
        senderPublicKey: String?,                // Sender's public key.
        signature: String!,                      // Transaction signature.
        asset: TransactionAsset.Delegate? = nil, // Transaction asset, dependent on tx type.
        vendorField: String? = nil,              // vendorField info.
        confirmations: Int!                      // Total confirmations of transaction
}
