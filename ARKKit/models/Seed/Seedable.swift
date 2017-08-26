//
//  Seedable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Seedable {}

extension Seedable {
    
    static public func from(_ networkType: NetworkType) -> Seed {
        var seed = Seed()
            seed.nethash = hash(from: networkType)
        let peerSeeds = seeds(from: networkType)
            seed.peers = peerSeeds
        let seedCount = UInt32(peerSeeds.count)
        let random = Int(arc4random_uniform(seedCount) + 0)
            seed.randomPeer = peerSeeds[random]
        return seed
    }
    
    static public func hash(from networkType: NetworkType) -> String {
        return networkType == .main ? Defaults.Network.Hash.main : Defaults.Network.Hash.dev
    }
    
    static public func seeds(from networkType: NetworkType) -> [String] {
        return networkType == .main ? Defaults.Network.Seed.Peers.main : Defaults.Network.Seed.Peers.dev
    }
    
    static public func seeds(of ip: String, on networkType: NetworkType) -> [String] {
        var seeded: [String] = Seed.from(networkType).peers, deseeded: [String] = []
        for seed in seeded where seed != ip { deseeded.append(seed) }
        return deseeded
    }
    
}
