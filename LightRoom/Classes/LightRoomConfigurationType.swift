//
//  LightRoomConfigurationType.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 12/30/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol LightRoomConfigurationType: class {
    
    func filterGen(json: JSON) throws -> FilterGen
}


