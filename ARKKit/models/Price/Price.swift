//
//  Price.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public struct Price {
    
    public struct amount {
         public var toArk: UInt64
        init(_ amount: Double){
            toArk = UInt64(amount * 100000000.00)
        }
    }
    
    public struct arkAmount {
        public var toStandard: Double
        init(_ arkAmount: Int){
            toStandard = Double(arkAmount) / 100000000.00
        }
    }
    
}

//    static public var USD: String { return get prices }
//    static public var BTC: String { return }
//    static public var EUR: String { return }

