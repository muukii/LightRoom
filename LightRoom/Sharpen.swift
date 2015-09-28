//
//  Sharpen.swift
//  LightRoom
//
//  Created by Muukii on 8/27/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    public enum Sharpen {
        
        /**
        CISharpenLuminance
        Increases image detail by sharpening.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public class SharpenLuminance: CIFilterGen, FilterJSONConvertible {
            
            public required init(sharpness: Double) {
                
                super.init(filterName: "CISharpenLuminance", parameters: [
                    kCIInputSharpnessKey: sharpness,
                    ])
            }
        }
        
        /**
        CIUnsharpMask
        Increases the contrast of the edges between pixels of different colors in an image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public class UnsharpMask: CIFilterGen, FilterJSONConvertible {
            
            public required init(radius: Double, intencity: Double) {
                
                super.init(filterName: "CIUnsharpMask", parameters: [
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    ])
            }
        }
    }
}