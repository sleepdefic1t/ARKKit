//
//  Networkable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Networkable {}

extension Networkable {
    
    static public func offline(from networkType: NetworkType) -> Network {
        var network = Network()
            network.ip = Seed.from(networkType).randomPeer
            network.hash = Seed.from(networkType).nethash
        let httpIP: String = "http://" + network.ip
            network.url = httpIP + Port.from(networkType).string
            network.peers = Seed.seeds(of: network.ip, on: networkType)
        return network
    }
    
    static public func online(from networkType: NetworkType) -> Network {
        var network = Network()
        let peers = Peer.online(from: networkType)
        let random = Int(arc4random_uniform(UInt32(peers.count)) + 0)
        let randomPeer = peers[random]
            network.ip = randomPeer.ip
            network.hash = Seed.hash(from: networkType)
        let httpIP: String = "http://" + network.ip
            network.url = httpIP + Port.from(networkType).string
            network.peers = Seed.seeds(of: network.ip, on: networkType)
        return network
    }
    
}
