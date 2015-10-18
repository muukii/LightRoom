//
//  Gradient.swift
//  LightRoom
//
//  Created by Muukii on 9/8/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

public typealias ImageGenerator = () -> CIImage

public extension LightRoom {
    
    /**
    CICategoryGradient
    */
    public enum Gradient {
        
        /**
        CIGaussianGradient
        Generates a gradient that varies from one color to another using a Gaussian distribution.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func gaussianGradient(
            center center: Vector2,
            color0: UIColor,
            color1: UIColor,
            radius: Double) -> ImageGenerator {
                return {

                    let parameters = [
                        kCIInputCenterKey: center.CIVector,
                        "inputColor0": color0,
                        "inputColor1": color1
                    ]
                    
                    let filter = CIFilter(name: "CIGaussianGradient", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CILinearGradient
        Generates a gradient that varies along a linear axis between two defined endpoints.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func linearGradient(
            point0 point0: Vector2,
            point1: Vector2,
            color0: UIColor,
            color1: UIColor) -> ImageGenerator {
                return {
                    
                    let parameters = [
                        "inputPoint0": point0.CIVector,
                        "inputPoint1": point1.CIVector,
                        "inputColor0": color0,
                        "inputColor1": color1,
                    ]
                    
                    let filter = CIFilter(name: "CILinearGradient", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        
        /**
        CIRadialGradient
        Generates a gradient that varies radially between two circles having the same center.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func radialGradient(
            center center: Vector2,
            radius0: Double,
            radius1: Double,
            color0: UIColor,
            color1: UIColor) -> ImageGenerator {
                return {
                    
                    let parameters = [
                        kCIInputCenterKey: center.CIVector,
                        "inputRadius0": radius0,
                        "inputRadius1": radius1,
                        "inputColor0": color0,
                        "inputColor1": color1,
                    ]
                    
                    let filter = CIFilter(name: "CIRadialGradient", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CISmoothLinearGradient
        Generates a gradient that uses an S-curve function to blend colors along a linear axis between two defined endpoints.
        */
        @available(iOS 7.0, *)
        public static func smoothLinearGradient(
            point0 point0: Vector2,
            point1: Vector2,
            color0: UIColor,
            color1: UIColor) -> ImageGenerator {
                return {
                    
                    let parameters = [
                        "inputPoint0": point0.CIVector,
                        "inputPoint1": point1.CIVector,
                        "inputColor0": color0,
                        "inputColor1": color1,
                    ]
                    
                    let filter = CIFilter(name: "CISmoothLinearGradient", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
    }
}