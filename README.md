# <img src="https://github.com/sleepdefic1t/ARKKit/blob/master/ARKKit-Banner.png" alt="ARKKit" style="width=65%;">
a  macOS  &  iOS  Swift  Framework  for  [Ark.io](https://ark.io).

[![Swift Version](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](https://developer.apple.com/swift/) 
![Platform](https://img.shields.io/badge/iOS->=11-52B3D9.svg?style=flat) 
![Platform](https://img.shields.io/badge/macOS->=10.12.0-52B3D9.svg?style=flat) 
[![Xcode Version](https://img.shields.io/badge/xcode-9.0b5-52B3D9.svg?style=flat)](https://developer.apple.com/xcode/)  

[![BUILD](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat)](https://github.com/sleepdefic1t) 
[![License: CC BY-SA 4.0](https://img.shields.io/badge/license-CC%20BY--SA%204.0-BE90D4.svg?style=flat)](http://creativecommons.org/licenses/by-sa/4.0/)  

![Platform](https://img.shields.io/badge/iOS-85%25-green.svg?style=flat) 
![Platform](https://img.shields.io/badge/macOS:-85%25-green.svg?style=flat) 
![Platform](https://img.shields.io/badge/Total%20Complete-85%25-green.svg?style=flat)  
 

# What is ARKKit?
  ARKKit is wrapper for interacting with the [***Ark Ecosystem***](https://ark.io).
  It is written purely in Swift 4.0, using no external dependencies or libraries.
  This allows quick and easy integration into your Computer, Server, or iDevice project!

# Todo:

- [ ] Signature/Cryptographic Integration
- [ ] Transaction Creation & Signing
- [ ] Voting
- [ ] Delegate Registration
- [ ] TBA*
- [ ] TBA*
- [ ] Your suggestions!


# Usage

samples:  

##

Check an account on mainnet or devnet:
```swift
  let devAccount = ARK.dev.account(from: "DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA")  
  let mainAccount = ARK.main.account(from: "AZreeHxX23s4jttL3ML8n6A2aLrwHPfVGZ")  
```
returning:
```
Account(username: nil,
        address: DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA,
        balance: 1901565824885,
        unconfirmedBalance: 1901565824885,
        publicKey: 0275776018638e5c40f1b922901e96cac2caa734585ef302b4a2801ee9a338a456,
        unconfirmedSignature: nil,
        secondSignature: nil,
        secondPublicKey: Optional("03ad2a481719c80571061f0c941d57e91c928700d8dd132726edfc0bf9c4cb2869"),
        multisignatures: Optional([]), unconfirmedMultisignatures: Optional([])) 
```
##

See all of the blocks on mainnet or devnet:
```swift
  let allDevBlocks = ARK.dev.allBlocks()  
  let allMainBlocks = ARK.main.allBlocks()  
```
returning:
```
allBlocks = [
    Block(id: 711675773079271579,
          version: 0, timestamp: 13737984,
          height: 1015588,
          previousBlock: 11596800618568825334,
          numberOfTransactions: 0,
          totalAmount: 0,
          totalFee: 0,
          reward: 200000000,
          payloadLength: 0,
          payloadHash: e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855,
          generatorPublicKey: 03bd4f16e39aaba5cba6a87b7498b08ce540f279be367e68ae96fb05dfabe203ad,
          generatorId: DBi2HdDY8TqMCD2aFLVomEF92gzeDmEHmR,
          blockSignature: 3045022100a9e3381e506daa6f050f2ebdb0de584a3f7f9a7b7caba03ff2874d086e8911250220146719ba882ebd9847857a8b681b932616f1544008cc0a02e48613fd75df256d,
          confirmations: 1,
          totalForged: 200000000),
    Block(id: 11596800618568825334,
          version: 0,
          timestamp: 13737976,
          height: 1015587,
          previousBlock: 16455111908480150750,
          numberOfTransactions: 0,
          totalAmount: 0,
          totalFee: 0,
          reward: 200000000,
          payloadLength: 0,
          payloadHash: ............
```

or check the current block-height of a given network:
```swift
  let currentBlockHeight = Block.height(on: .dev)   /* returned "1015611" */
```

##

Cross-convert price values between standard(human-readable), and ѦRK:
```swift
  let standardPrice = Price.arkAmount(550000000).toStandard   /* returns "5.5" */
  let arkPrice = Price.amount(5.5).toArk  /* returns "550000000" */
```

##

Check the status of a Node/Peer:
```swift
  let statusOfPeer = ARK.dev.statusOfPeerWith(ip: "35.188.148.247")  
```
returns:
```
  statusOfIP = Peer(ip: 35.188.148.247,
                    port: 4002,
                    version: 1.1.0,
                    os: linux4.10.0-32-generic,
                    height: 1015589,
                    status: OK,
                    delay: 263) 
```

##

Check for network Peers/Seeds:
```swift
  let allNetworkSeeds = ARK.dev.allSeeds()  
```
returning:
```
 peers = [
      "167.114.29.51",
      "167.114.29.52",
      "167.114.29.53",
      "35.188.148.247",
      .................
      ] 
```

##

Get all of the transaction on a given network:
```swift      
  let allTransactions = ARK.dev.allTransactions()  
```
returning:
```
allTransactions = [
    Transaction(id: e40ce11cab82736da1cc91191716f3c1f446ca7b6a9f4f93b7120ef105ba06e8,
                blockID: 13149578060728881902,
                type: 0,
                timestamp: 0,
                amount: 12500000000000000,
                fee: 0,
                senderID: DUFeXjJmYt1mWY3auywA1EQSqfCv5kYYfP,
                recipientID: DGihocTkwDygiFvmg6aG8jThYTic47GzU9,
                senderPublicKey: Optional("03cb7bca143376721d0e9e3f3ccb0dc2e7e8470c06e630c3cef73f03e309b558ad"),
                signature: 3044022016ecdf3039e69514c7d75861b22fc076496b61c07a1fcf793dc4f5c76fa0532b0220579c4c0c9d13720f9db5d9df29ed8ceab0adc266c6c160d612d4894dc5867eb1,
                asset: Optional(ARKKit_macOSTests.TransactionAsset.Delegate(username: nil, publicKey: nil)),
                vendorField: nil,
                confirmations: 1015646),
    Transaction(id: eb0146ac79afc228f0474a5ae1c4771970ae7880450b998c401029f522cd8a21,]
                blockID: 13149578060728881902,
                type: 2,
                timestamp: 0,
                amount: 0,
                fee: 0,
                senderID: DNL81CT6WNG1PHjobBmLvKwLV3UUscBymB,
                recipientID: nil,
                senderPublicKey: Optional("03e5b39a83e6c7c952c5908089d4524bb8dda93acc2b2b953247e43dc4fe9aa3d1"),
                signature: 3045022100e3e38811778023e6f17fefd447f179d45ab92c398c7cfb1e34e2f6e1b167c95a022070c36439ecec0fc3c43850070f29515910435d389e059579878d61b5ff2ea337,
                asset: Optional(ARKKit_macOSTests.TransactionAsset.Delegate(username: genesis_1,
                                                                            publicKey: 03e5b39a83e6c7c952c5908089d4524bb8dda93acc2b2b953247e43dc4fe9aa3d1)),
                vendorField: nil,
                confirmations: 1015646),
    .......................
    ]
```

or get the total number of transactions on a given network:
```swift
  let totalTransactions = ARK.main.totalNumberOfTransactions()  /* returned "137761" */
```  
  


# Recommended Resources

## More Ѧrk Developer-Language Integrations:  

- **Go**  
    - [**ark-go**](https://github.com/ArkEcosystem/ark-go): https://github.com/ArkEcosystem/ark-go  
- **Java**
    - [**ark-java**](https://github.com/ArkEcosystem/ark-java): https://github.com/ArkEcosystem/ark-java  
- **JavaScript**
    - [**ark-js**](https://github.com/ArkEcosystem/ark-js): https://github.com/ArkEcosystem/ark-js  
- **Laravel**
    - [**Laravel-Ark**](https://github.com/faustbrian/Laravel-Ark): https://github.com/faustbrian/Laravel-Ark  
- **.Net**
    - [**ark-net**](https://github.com/ArkEcosystem/ark-net): https://github.com/ArkEcosystem/ark-net  
- **PHP**
    - [**Ark-PHP-Client**](https://github.com/faustbrian/Ark-PHP-Client): https://github.com/faustbrian/Ark-PHP-Client  
- **Python**
    - [**Arky**](https://github.com/ArkEcosystem/arky): https://github.com/ArkEcosystem/arky  
- **Ruby**
    - [**Ark-Ruby**](https://github.com/faustbrian/Ark-Ruby): https://github.com/faustbrian/Ark-Ruby  
- **TypeScript**
    - [**ark-ts**](https://github.com/ArkEcosystem/ark-ts): https://github.com/ArkEcosystem/ark-ts  


#### Tip Jar
``ѦRK [Ѧ]:`` ```AZreeHxX23s4jttL3ML8n6A2aLrwHPfVGZ``` 

``DѦRK [DѦ]:`` ```DHQ4Fjsyiop3qBR4otAjAu6cBHkgRELqGA``` 
