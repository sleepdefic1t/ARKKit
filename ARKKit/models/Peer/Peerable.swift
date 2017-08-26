//
//  Peerable.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Peerable {}

extension Peerable {
    
    static public func online(from networkType: NetworkType) -> [Peer] {
        let node = Network.offline(from: networkType)
        let path = Defaults.API.Endpoints.Peers.peers
        let urlString = node.url! + path
        var arkPeers: [Peer] = []
        API.processObject(urlString: urlString) { result in
            for peers in result where (peers.key as! String == Defaults.Keys.Peer.peersKey) {
                for peer in (peers.value as! NSArray) {
                    let arkPeer = iteratedPeerResults(in: peer as! NSDictionary)
                    arkPeers.append(arkPeer)
                }
            }
        }
        return arkPeers
    }
    
    static public func status(of ip: String, on networkType: NetworkType) -> Peer {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Peers.peersFromIP + ip + Defaults.API.Endpoints.Peers.peersWithIPPort + String(describing: Port.from(.dev).number!)
        let urlString = node.url! + path
        var arkPeer = Peer()
        API.processObject(urlString: urlString) { result in
            for item in result where (item.key as! String == Defaults.Keys.Peer.peerKey) {
                arkPeer = iteratedPeerResults(in: item.value as! NSDictionary)
            }
        }
        return arkPeer
    }
    
    fileprivate static func iteratedPeerResults(in dictionary: NSDictionary) -> Peer {
        typealias peerKeys = Defaults.Keys.Peer
        var arkPeer = Peer()
        for entry in dictionary {
            switch String(describing: entry.key) {
                case peerKeys.ip: arkPeer.ip = String(describing: entry.value)
                case peerKeys.port: arkPeer.port = entry.value as! Int
                case peerKeys.version: arkPeer.version = String(describing: entry.value)
                case peerKeys.os: arkPeer.os = String(describing: entry.value)
                case peerKeys.height: arkPeer.height = entry.value as! Int
                case peerKeys.status: arkPeer.status = String(describing: entry.value)
                case peerKeys.delay: arkPeer.delay = entry.value as! Int
            default: break
            }
        }
        return arkPeer
    }
    
}
