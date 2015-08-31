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
        public static func highlightShadowAdjust(
            highlightAmount highlightAmount: Double? = nil,
            shadowAmount: Double? = nil) -> Filter {
            return { image in
                
                var parameters: [String: AnyObject] = [kCIInputImageKey: image]
                parameters["inputHighlightAmount"] = highlightAmount
                parameters["inputShadowAmount"] = shadowAmount

                let filter = CIFilter(name: "CIHighlightShadowAdjust", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}