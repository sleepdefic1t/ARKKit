//
//  Defaults.swift
//  ARKKit
//
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Defaults {
    
    /* ============================================= */
    /* ******************** API ******************** */
    public struct API {
        
        /* ****************** Endpoints ***************** */
        public struct Endpoints {
            
            /* ****************** Accounts ******************* */
            public struct Account {
                static public var
                    accounts = "/api/accounts",
                    accountWithAddress = accounts + "?address=",
                    balance = "/api/accounts/getBalance",
                    generatePublicKey = "/api/accounts/generatePublicKey",
                    publicKey = "/api/accounts/getPublicKey"
            }
            /* ********************************************** */
            
            /* ****************** Blocks ******************** */
            public struct Blocks {
                static public var
                    blocks = "/api/blocks",
                    get = blocks + "/get",
                    getFee =  blocks + "/getFee",
                    getHeight = blocks + "/getHeight"
            }
            /* ********************************************** */
            
            /* ***************** Delegates ****************** */
            
            public struct Delegates {
                static public var
                    delegates = "/api/delegates",
                    delegatesFee = delegates + "/fee",
                    getForgedByAccount = delegates + "/forging/getForgedByAccount"
            }
            /* ********************************************** */
            
            /* ****************** Forging ******************* */
            public struct Forging {
                static public var
                    forging = "/api/delegates/forging",
                    forgingWithPublicKey = forging + "/getForgedByAccount?generatorPublicKey="
            }
            /* ********************************************** */
            
            /* ******************* Peers ******************** */
            public struct Peers {
                static public var
                peers = "/api/peers",
                peersFromIP = peers + "/get?ip=",
                peersWithIPPort = "&port="
            }
            /* ********************************************** */
            
            /* **************** Transactions **************** */
            public struct Transactions {
                static public var
                transactions = "/api/transactions"
            }
            /* ********************************************** */
            
        }
        /* ********************************************** */
    }
    /* ********************************************** */
    /* ============================================= */
    
    
    /* ============================================= */
    /* ******************** Fees ******************** */
    public struct Fees {
        static public var
            send = 10000000,
            vote = 100000000,
            delegate = 2500000000,
            secondsignature = 500000000,
            multisignature = 500000000
    }
    /* ********************************************** */
    /* ********************************************** */
    
    
    /* ============================================= */
    /* ******************* Keys ******************* */
    public struct Keys {
        
        /* ******************* Account ******************* */
        public struct Account {
            public static var
                accountKey = "account",
                address: String = "address",
                unconfirmedBalance: String = "unconfirmedBalance",
                balance: String = "balance",
                publicKey: String = "publicKey",
                unconfirmedSignature: String = "unconfirmedSignature",
                secondSignature: String = "secondSignature",
                secondPublicKey: String = "secondPublicKey",
                multisignatures: String = "multisignatures",
                unconfirmedMultisignatures: String = "u_multisignatures"
        }
        /* ********************************************** */
        
        /* ******************* Blocks ******************* */
        public struct Blocks {
            static public var
                blocksKey = "blocks",
                blocksFee = "fee",
                id = "id",
                version = "version",
                timestamp = "timestamp",
                height = "height",
                previousBlock = "previousBlock",
                numberOfTransactions = "numberOfTransactions",
                totalAmount = "totalAmount",
                totalFee = "totalFee",
                reward = "reward",
                payloadLength = "payloadLength",
                payloadHash = "payloadHash",
                generatorPublicKey = "generatorPublicKey",
                generatorId = "generatorId",
                blockSignature = "blockSignature",
                confirmations =  "confirmations",
                totalForged = "totalForged"
        }
        /* ********************************************** */
        
        /* ****************** Delegate ****************** */
        public struct Delegate {
            static public var
                delegatesKey = "delegates",
                delegatesFee = "fee",
                username = "username",
                address = "address",
                publicKey = "publicKey",
                vote = "vote",
                producedBlocks = "producedblocks",
                missedBlocks = "missedblocks",
                rate = "rate",
                productivity = "productivity",
                approval = "approval"
        }
        /* ********************************************** */
        
        /* ****************** Forging ******************* */
        public struct Forging {
            static public var
                fees = "fees",
                rewards = "rewards",
                forged = "forged"
        }
        /* ********************************************** */
        
        /* ******************** Peer ******************** */
        public struct Peer {
            static public var
                peerKey = "peer",
                peersKey = "peers",
                ip = "ip",
                port = "port",
                version = "version",
                os = "os",
                height = "height",
                status = "status",
                delay = "delay"
        }
        /* ********************************************** */

        /* **************** Transactions *************** */
        public struct Transactions {
            static public var
                transactionsKey = "transactions",
                count = "count",
                id = "id",
                blockID = "blockid",
                type = "type",
                timestamp = "timestamp",
                amount =  "amount",
                fee = "fee",
                senderID = "senderId",
                recipientID = "recipientId",
                senderPublicKey = "senderPublicKey",
                signature = "signature",
                confirmations = "confirmations"
            
            /* ******************* Assets ******************* */
            public struct Assets {
                static public var
                    asset = "asset",
                    delegate = "delegate",
                    username = "username",
                    publicKey = "publicKey",
                    vendorField = "vendorField"
            }
            /* ********************************************** */

        }
        /* ********************************************** */
        
    }
    /* ********************************************** */
    /* ============================================= */
    
    
    /* ============================================= */
    /* ****************** Network ******************* */
    public struct Network {
        
        /* ******************** Port ******************** */
        public struct Port {
            static public var
                main: Int = 4001,
                dev: Int = 4002
        }
        /* ********************************************** */
        
        /* ******************** Hash ******************** */
        public typealias ARKHash = String
        public struct Hash {
            static public var
                main: ARKHash = "6e84d08bd299ed97c212c886c98a57e36545c8f5d645ca7eeae63a8bd62d8988",
                dev: ARKHash = "578e820911f24e039733b45e4882b73e301f813a0d2c31330dafda84534ffa23"
        }
        /* ********************************************** */
        
        /* ******************** Seed ******************** */
        public struct Seed {
            
            /* ******************** Peers ******************** */
            public struct Peers {
                /* ******************** Main ******************** */
                static public var
                    main: [String] = [
                        "5.39.9.240",
                        "5.39.9.241",
                        "5.39.9.242",
                        "5.39.9.243",
                        "5.39.9.244",
                        "5.39.9.250",
                        "5.39.9.251",
                        "5.39.9.252",
                        "5.39.9.253",
                        "5.39.9.254",
                        "5.39.9.255",
                        "5.39.53.48",
                        "5.39.53.49",
                        "5.39.53.50",
                        "5.39.53.51",
                        "5.39.53.52",
                        "5.39.53.53",
                        "5.39.53.54",
                        "5.39.53.55",
                        "37.59.129.160",
                        "37.59.129.161",
                        "37.59.129.162",
                        "37.59.129.163",
                        "37.59.129.164",
                        "37.59.129.165",
                        "37.59.129.166",
                        "37.59.129.167",
                        "37.59.129.168",
                        "37.59.129.169",
                        "37.59.129.170",
                        "37.59.129.171",
                        "37.59.129.172",
                        "37.59.129.173",
                        "37.59.129.174",
                        "37.59.129.175",
                        "193.70.72.80",
                        "193.70.72.81",
                        "193.70.72.82",
                        "193.70.72.83",
                        "193.70.72.84",
                        "193.70.72.85",
                        "193.70.72.86",
                        "193.70.72.87",
                        "193.70.72.88",
                        "193.70.72.89",
                        "193.70.72.90",
                        "35.188.167.5" //<- sleepdeficit
                ]
                /* ********************************************** */
                
                /* ******************** Dev ********************* */
                static public var
                    dev: [String] = [
                        "167.114.29.51",
                        "167.114.29.52",
                        "167.114.29.53",
                        "167.114.29.54",
                        "167.114.29.55",
                        "35.188.148.247" //<- sleepdefict
                ]
                /* ********************************************** */
                
            }
            /* ********************************************** */
        }
        /* ********************************************** */

    }
    /* ********************************************** */
    /* ============================================= */
    
    
}
