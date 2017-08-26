//
//  ARK.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public enum ARK {
    case  main, dev
    
    
    
    internal var networkType: NetworkType { return self == .main ? .main : .dev }
    
    
    
    
    public func account(from address: String) -> Account {
        return Account.with(address: address, on: networkType)
    }
    
    
    
    
    public func allBlocks() -> [Block] {
        return Block.all(on: networkType)
    }
    
    public func mostRecentBlock() -> Block {
        return Block.mostRecent(on: networkType)
    }
    
    public func blockWithID(_ id: String) -> Block {
        return Block.with(id: id, on: networkType)
    }
    
    public func blockNetworkFee() -> Int {
        return Block.arkFee(on: networkType)
    }
    
    public func blockHeight() -> Int {
        return Block.height(on: networkType)
    }
    
    public func blocksForged(by generatorPublicKey: String) -> Int64 {
        return Block.forged(by: generatorPublicKey, on: networkType)
    }
    
    
    
    
    public func allDelegates() -> [Delegate] {
        return Delegate.all(on: networkType)
    }
    
    public func delegateWith(username: String) -> Delegate {
        return Delegate.with(username: username, on: networkType)
    }
    
    public func delegateFee() -> Int {
        return Delegate.fee(on: networkType)
    }
    
    
    
    
    public func forgedBy(publicKey: String) -> Forging {
        return Forging.from(publicKey, on: networkType)
    }
    
    
    
    
    public func offlineNetwork() -> Network {
        return Network.offline(from: networkType)
    }
    
    public func onlineNetwork() -> Network {
        return Network.online(from: networkType)
    }
    
    
    
    
    public func portForNetwork() -> Port {
        return Port.from(networkType)
    }
    
    
    
    
    public func amountToArk(_ amount: Double) -> UInt64 {
        return Price.amount(amount).toArk
    }
    
    public func arkAmountToStandard(_ amount: Int) -> Double {
        return Price.arkAmount(amount).toStandard
    }
    
    
    
    
    public func onlinePeers() -> [Peer] {
        return Peer.online(from: networkType)
    }
    
    public func statusOfPeerWith(ip: String) -> Peer {
        return Peer.status(of: ip, on: networkType)
    }

    
    
    
    public func randomSeed() -> Seed {
        return Seed.from(networkType)
    }
    
    public func networkHash() -> String {
        return Seed.hash(from: networkType)
    }
   
    public func allSeeds() -> [String] {
        return Seed.seeds(from: networkType)
    }
    
    
    
    
    public func allTransactions() -> [Transaction] {
        return Transaction.all(on: networkType)
    }
    
    public func totalNumberOfTransactions() -> Int {
        return Transaction.totalNumberOfTransactions(on: networkType)
    }
    
    
}
