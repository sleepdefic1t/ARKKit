//
//  Transactionable.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol Transactionable {}

extension Transactionable {
    
    static public func all(on networkType: NetworkType) -> [Transaction] {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Transactions.transactions
        let urlString = node.url! + path
        var arkTransactions: [Transaction] = []
        API.processObject(urlString: urlString) { result in
            for transactions in result where (transactions.key as! String == Defaults.Keys.Transactions.transactionsKey) {
                for transaction in (transactions.value as! NSArray) {
                    let tx = iteratedTransactionResults(in: transaction as! NSDictionary)
                    arkTransactions.append(tx)
                }
            }
        }
        return arkTransactions
    }
    
    static public func totalNumberOfTransactions(on networkType: NetworkType) -> Int {
        let node = Network.online(from: networkType)
        let path = Defaults.API.Endpoints.Transactions.transactions
        let urlString = node.url! + path
        var totalTransactions: Int = 0
        API.processObject(urlString: urlString) { result in
            for item in result where (item.key as! String) == Defaults.Keys.Transactions.count {
                totalTransactions = Int(String(describing: item.value))!
            }
        }
        return totalTransactions
    }
    
    fileprivate static func iteratedTransactionResults(in dictionary: NSDictionary) -> Transaction {
        typealias transactionKeys = Defaults.Keys.Transactions
        var arkTransaction = Transaction()
        for entry in dictionary {
            switch String(describing: entry.key) {
                case transactionKeys.id: arkTransaction.id = String(describing: entry.value)
                case transactionKeys.blockID: arkTransaction.blockID = String(describing: entry.value)
                case transactionKeys.type: arkTransaction.type = entry.value as! Int
                case transactionKeys.timestamp: arkTransaction.timestamp = entry.value as! Int
                case transactionKeys.amount: arkTransaction.amount = entry.value as! Int
                case transactionKeys.fee: arkTransaction.fee = entry.value as! Int
                case transactionKeys.senderID: arkTransaction.senderID = String(describing: entry.value)
                case transactionKeys.recipientID: arkTransaction.recipientID = String(describing: entry.value)
                case transactionKeys.senderPublicKey: arkTransaction.senderPublicKey = String(describing: entry.value)
                case transactionKeys.Assets.asset: arkTransaction.asset = TransactionAsset.Delegate.from(entry: entry.value as! NSDictionary)
                case transactionKeys.Assets.vendorField: arkTransaction.vendorField = String(describing: entry.value)
                case transactionKeys.signature: arkTransaction.signature = String(describing: entry.value)
                case transactionKeys.confirmations: arkTransaction.confirmations = entry.value as! Int
            default: break
            }
        }
        return arkTransaction
    }
    
}
