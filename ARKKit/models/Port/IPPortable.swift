//
//  IPPortable.swift
//  ARKKit
//
//  Created by simon on 8/26/17.
//  Copyright © 2017 sleepdefic1t. All rights reserved.
//

import Foundation

public protocol IPPortable {}

extension IPPortable {
    
    static public func from(_ networkType: NetworkType) -> Port {
        var port = Port()
            port.number = (networkType == .main) ? Defaults.Network.Port.main : Defaults.Network.Port.dev
            port.string = ":" + port.number.description
        return port
    }
    
}
