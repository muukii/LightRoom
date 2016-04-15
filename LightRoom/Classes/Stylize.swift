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
         CICrystallize
         
         Creates polygon-shaped color blocks by aggregating source pixel-color values.
         */
        @available(iOS 9.0, OSX 10.4, *)
        public final class Crystallize: FilterComponent {
            
            public required init(
                radius: Double? = nil,
                center: Vector2? = nil) {
                
                var parameters: [String: AnyObject] = [:]
                parameters["inputRadius"] = radius
                parameters["inputCenter"] = center?.CIVector
                
                super.init(filterName: "CICrystallize", parameters: parameters)
            }
        }
        
        /**
        CIHighlightShadowAdjust
        
        Adjust the tonal mapping of an image while preserving spatial detail.
        */
        @available(iOS 5.0, OSX 10.7, *)
        public final class HighlightShadowAdjust: FilterComponent {
            
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