//
//  Stylize.swift
//  LightRoom
//
//  Created by Muukii on 9/1/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    public enum Stylize {
        
        /**
        CIHighlightShadowAdjust
        
        Adjust the tonal mapping of an image while preserving spatial detail.
        */
        @available(iOS 5.0, OSX 10.7, *)
        public final class HighlightShadowAdjust: CIFilterGen, FilterJSONConvertible {
            
            public required init(
                highlightAmount: Double? = nil,
                shadowAmount: Double? = nil) {
                
                    var parameters: [String: AnyObject] = [:]
                    parameters["inputHighlightAmount"] = highlightAmount
                    parameters["inputShadowAmount"] = shadowAmount
                    
                    super.init(filterName: "CIHighlightShadowAdjust", parameters: parameters)
            }
        }
    }
}