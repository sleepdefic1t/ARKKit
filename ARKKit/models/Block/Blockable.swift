//
//  Blockable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Blockable {}

extension Blockable  {

    static public func all(on networkType: NetworkType) -> [Block] {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Blocks.blocks
        let urlString = node.url! + path
        var arkBlocks: [Block] = []
        API.processObject(urlString: urlString) { result in
            for blocks in result where (blocks.key as! String == Defaults.Keys.Blocks.blocksKey) {
                for block in (blocks.value as! NSArray) {
                    let arkBlock: Block = iteratedBlockResults(in: block as! NSDictionary)
                    arkBlocks.append(arkBlock)
                }
            }
        }
        return arkBlocks
    }
    
    static public func mostRecent(on networkType: NetworkType) -> Block { return all(on: networkType).first! }
    
    static public func with(id: String, on networkType: NetworkType) -> Block {
        let allBlocks = all(on: networkType)
        var idBlock = Block()
        for block in allBlocks where block.id == id { idBlock = block }
        return idBlock
    }
    
    static public func arkFee(on networkType: NetworkType) -> Int {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Blocks.getFee
        let urlString = node.url! + path
        var arkFee: Int = 0
        API.processObject(urlString: urlString) { result in
            for item in result where (item.key as! String == Defaults.Keys.Blocks.blocksFee) {
                arkFee = item.value as! Int
            }
        }
        return arkFee
    }
    
    static public func height(on networkType: NetworkType) -> Int {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Blocks.getHeight
        let urlString = node.url! + path
        var height: Int = 0
        API.processObject(urlString: urlString) { result in
            for item in result where (item.key as! String == Defaults.Keys.Blocks.height) {
                height = item.value as! Int
            }
        }
        return height
    }
    
    static public func forged(by generatorPublicKey: String, on networkType: NetworkType) -> Int64 {
        let allBlocks = all(on: networkType)
        var idBlock = Block()
        for block in allBlocks where block.generatorPublicKey == generatorPublicKey { idBlock = block }
        return idBlock.totalForged
    }
    
    fileprivate static func iteratedBlockResults(in dictionary: NSDictionary) -> Block {
        typealias blockKeys = Defaults.Keys.Blocks
        var arkBlock = Block()
        for entry in dictionary {
            switch String(describing: entry.key) {
                case blockKeys.id: arkBlock.id = String(describing: entry.value)
                case blockKeys.version: arkBlock.version = entry.value as! Int64
                case blockKeys.timestamp: arkBlock.timestamp = entry.value as! Int64
                case blockKeys.height: arkBlock.height = entry.value as! Int64
                case blockKeys.previousBlock: arkBlock.previousBlock = String(describing: entry.value)
                case blockKeys.numberOfTransactions: arkBlock.numberOfTransactions = entry.value as! Int64
                case blockKeys.totalAmount: arkBlock.totalAmount = entry.value as! Int64
                case blockKeys.totalFee: arkBlock.totalFee = entry.value as! Int64
                case blockKeys.reward: arkBlock.reward = entry.value as! Int64
                case blockKeys.payloadLength: arkBlock.payloadLength = entry.value as! Int64
                case blockKeys.payloadHash: arkBlock.payloadHash = entry.value as! String
                case blockKeys.generatorPublicKey: arkBlock.generatorPublicKey = String(describing: entry.value)
                case blockKeys.generatorId: arkBlock.generatorId = String(describing: entry.value)
                case blockKeys.blockSignature: arkBlock.blockSignature = String(describing: entry.value)
                case blockKeys.confirmations: arkBlock.confirmations = entry.value as! Int64
                case blockKeys.totalForged: arkBlock.totalForged = Int64(entry.value as! String)
            default: break
            }
        }
        return arkBlock
    }
    
}
