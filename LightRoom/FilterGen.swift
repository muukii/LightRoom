//
//  FilterGen.swift
//  LightRoom
//
//  Created by Muukii on 9/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol FilterGen {
    
    var filterName: String { get }
    var filter: Filter { get }
}

public class CIFilterGen: FilterGen {
    
    public let filterName: String
    public let parameters: [String: AnyObject]
    
    init(filterName: String, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
    }
    
    public var filter: Filter {
        
        return LightRoom.createFilter(name: filterName, parameters: parameters)
    }
}

