//
//  Peer.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Peer: Peerable {
    public var
        ip: String!,
        port: Int!,
        version: String!,
        os: String!,
        height: Int!,
        status: String!,
        delay: Int!
}
