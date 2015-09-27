//
//  JSONBridge.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import CoreImage
import SwiftyJSON

public extension LightRoom {

    /**
    Create Filters From JSON
    
    JSON example
    
    {
        filters: [
            {
                CIFilterName: "CIToneCurve",
                parameters: {
                    
                }
            },
        ],
    }
    */
    static func createFilters(json json: JSON) -> [Filter] {
        
        guard let filterJSONs = json["filters"].array else {
            return []
        }
        
        let parseParameters: ([String: AnyObject]? -> [String: AnyObject]) = { parameters in
            
            guard let parameters = parameters else {
            
                return [ : ]
            }
            
            var parsedParameters: [String: AnyObject] = [ : ]
            
            return parsedParameters
        }
        
        return filterJSONs.reduce([Filter]()) { (var filters, filterJSON) in
            
            filters.append(
                LightRoom.createFilter(
                    name: filterJSON["CIFilterName"].stringValue,
                    parameters: parseParameters(filterJSON["parameters"].dictionaryObject)
                )
            )
            return filters
        }
    }
}
