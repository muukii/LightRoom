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
        public static func sharpenLuminance(sharpness sharpness: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputSharpnessKey: sharpness,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CISharpenLuminance", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIUnsharpMask
        Increases the contrast of the edges between pixels of different colors in an image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func unsharpMask(radius radius: Double, intencity: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIUnsharpMask", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}