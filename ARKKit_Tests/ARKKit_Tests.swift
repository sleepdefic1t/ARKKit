//
//  ARKKit_Tests.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import XCTest

#if os(iOS)
    import ARKKit_iOS
#elseif os(macOS)
    import ARKKit_macOS
#endif

class ARKKit_Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
        func testAccount() {
            print("\n **************************************************")
            print(" ****************** testAccount ******************* \n")
    
            let existingAccount = Account.with(address: "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA", on: .dev)
                print("\n existingAccount = \(existingAccount) \n")
    
            print("\n ******************** /account ********************")
            print(" ************************************************** \n \n")
        }
    
    
    
    
//    func testBlocks() {
//        print("\n **************************************************")
//        print(" ******************* testBlocks ******************* \n")
//
//        let allBlocks = Block.all(on: .dev)
//            print("\n allBlocks = \(allBlocks) \n")
//
//        let mostRecentBlock = Block.mostRecent(on: .dev)
//            print("\n mostRecentBlock = \(mostRecentBlock) \n")
//
//        let blockFromID = Block.with(id: "5703750602361087010", on: .dev)
//            print("\n blockFromID = \(blockFromID) \n")
//
//        let blockFee = Block.arkFee(on: .dev)
//        print("\n blockFee = \(blockFee) \n")
//
//        let blockHeight = Block.height(on: .dev)
//        print("\n blockHeight = \(blockHeight) \n")
//
//        let forgedBy = Block.forged(by: "0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456", on: .dev)
//            print("\n forgedBy = \(forgedBy) \n")
//
//        print("\n ******************** /blocks *********************")
//        print(" ************************************************** \n \n")
//    }
    
    
    //    func testDelegate() {
    //        print("\n **************************************************")
    //        print(" ******************* testDelegate ***************** \n")
    //
    //        let allDelegates = Delegate.all(on: .dev)
    //            print("\n allDelegates = \(allDelegates) \n")
    //
    //        let delegateWith = Delegate.with(username: "sleepdeficit", on: .dev)
    //            print("\n delegateWith = \(delegateWith) \n")
    //
    //        let delegateFee = Delegate.fee(on: .dev)
    //            print("\n delegateFee = \(delegateFee) \n")
    //
    //        print("\n ******************* /delegate *******************")
    //        print(" ************************************************* \n \n")
    //    }
    
    
    //    func testForging() {
    //        print("\n **************************************************")
    //        print(" ****************** testForging ******************* \n")
    //
    //        let forging = Forging.from("03c638259e874e38bb9621f29a907c3e2445b5bd61c76c3c3098bff83ebabbfeab", on: .dev)
    //            print("\n forging = \(forging) \n")
    //
    //        print("\n ******************** /forging ********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    
    //    func testNetwork() {
    //        print("\n **************************************************")
    //        print(" ****************** testNetwork ******************* \n")
    //
    //        let offlineNetwork = Network.offline(from: .dev)
    //            print("\n offlineNetwork = \(offlineNetwork) \n")
    //
    //        let onlineNetwork = Network.online(from: .dev)
    //        print("\n onlineNetwork = \(onlineNetwork) \n")
    //
    //        print("\n ******************** /network ********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    
    //    func testPeer() {
    //        print("\n **************************************************")
    //        print(" ******************** testPeer ******************** \n")
    //
    //        let allPeers = Peer.all(on: .dev)
    //            print("\n allPeers = \(allPeers) \n")
    //
    //        let statusOfIP = Peer.status(of: "35.188.148.247", on: .dev)
    //            print("\n statusOfIP = \(statusOfIP) \n")
    //
    //        print("\n ********************* /peer **********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    
    //    func testPort() {
    //        print("\n **************************************************")
    //        print(" ******************** testPort ******************** \n")
    //
    //        let port = Port.from(.dev)
    //            print("\n port = \(port) \n")
    //            print("\n port.number = \(port.number) \n")
    //            print("\n port = \(port.string) \n")
    //
    //        print("\n ********************* /port **********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    
    //    func testPrice() {
    //        print("\n **************************************************")
    //        print(" ******************** testPrice ******************* \n")
    
    //        let doublePrice = 5.5
    //            print("\n doublePrice = \(doublePrice) \n")
    //        let priceInArk = Price.amount(doublePrice).toArk
    //            print("\n priceInArk = \(priceInArk) \n")
    //
    //        let arkPrice = 17400000000
    //            print("\n arkPrice = \(arkPrice) \n")
    //        let priceInStandard = Price.arkAmount(arkPrice).toStandard
    //            print("\n priceInStandard = \(priceInStandard) \n")
    //
    //
    //        print("\n ********************* /price *********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    //    func testSeed() {
    //        print("\n **************************************************")
    //        print(" ******************** testSeed ******************* \n")
    //
    //        let hash = Seed.hash(from: .dev)
    //            print("\n hash = \(hash) \n")
    //
    //        let peers = Seed.peers(from: .dev)
    //            print("\n peers = \(peers) \n")
    //
    //        let peersOfIP = Seed.peers(of: "35.188.148.247", on: .dev)
    //            print("\n peersOfIP = \(peersOfIP) \n")
    //
    //        let allSeeds = Seed.allSeeds(from: .dev)
    //            print("\n allSeeds = \(allSeeds) \n")
    //
    //        let seeds = Seed.from(.dev)
    //            print("\n seeds = \(seeds) \n")
    //
    //
    //        print("\n ********************* /seed **********************")
    //        print(" ************************************************** \n \n")
    //    }
    
    
    //    func testTransaction() {
    //        print("\n **************************************************")
    //        print(" ***************** testTransaction **************** \n")
    //
    //        let allTransactions = Transaction.all(on: .dev)
    //            print("\n allTransactions = \(allTransactions) \n")
    //
    //        let totalNumberOfTransactions = Transaction.totalNumberOfTransactions(on: .dev)
    //            print("\n totalNumberOfTransactions = \(totalNumberOfTransactions) \n")
    //
    //        print("\n ****************** /transaction ******************")
    //        print(" ************************************************** \n \n")
    //    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
