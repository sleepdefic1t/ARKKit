//
//  Delegate.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Delegate: Delegable {
    public var
        username: String!,
        address: String!,
        publicKey: String!,
        vote: String!,
        producedBlocks: Int64!,
        missedBlocks: Int64!,
        rate: Int64!,
        productivity: Double!,
        approval: Double!
}
