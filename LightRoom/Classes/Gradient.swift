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
        public final class GaussianGradient: GeneratorComponent {
            public required init(
                cropRect: CGRect,
                center: Vector2,
                color0: UIColor,
                color1: UIColor,
                radius: Double) {
                    super.init(
                        filterName: "CIGaussianGradient",
                        cropRect: cropRect,
                        parameters: [
                            kCIInputCenterKey: center.CIVector,
                            "inputColor0": color0,
                            "inputColor1": color1
                        ]
                    )
            }
        }
        
        /**
        CILinearGradient
        Generates a gradient that varies along a linear axis between two defined endpoints.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class LinearGradient: GeneratorComponent {
            public required init(
                cropRect: CGRect,
                point0: Vector2,
                point1: Vector2,
                color0: UIColor,
                color1: UIColor) {
                    super.init(
                        filterName: "CILinearGradient",
                        cropRect: cropRect,
                        parameters: [
                            "inputPoint0": point0.CIVector,
                            "inputPoint1": point1.CIVector,
                            "inputColor0": color0,
                            "inputColor1": color1,
                        ]                    )
            }
        }
        
        /**
        CIRadialGradient
        Generates a gradient that varies radially between two circles having the same center.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class RadialGradient: GeneratorComponent {
            public required init(
                cropRect: CGRect,
                center: Vector2,
                radius0: Double,
                radius1: Double,
                color0: UIColor,
                color1: UIColor) {
                    super.init(
                        filterName: "CIRadialGradient",
                        cropRect: cropRect,
                        parameters:[
                            kCIInputCenterKey: center.CIVector,
                            "inputRadius0": radius0,
                            "inputRadius1": radius1,
                            "inputColor0": color0,
                            "inputColor1": color1,
                        ]
                    )
            }
        }
        
        /**
        CISmoothLinearGradient
        Generates a gradient that uses an S-curve function to blend colors along a linear axis between two defined endpoints.
        */
        @available(iOS 7.0, *)
        public final class SmoothLinearGradient: GeneratorComponent {
            public required init(
                cropRect: CGRect,
                point0: Vector2,
                point1: Vector2,
                color0: UIColor,
                color1: UIColor) {
                    super.init(
                        filterName: "CISmoothLinearGradient",
                        cropRect: cropRect,
                        parameters: [
                            "inputPoint0": point0.CIVector,
                            "inputPoint1": point1.CIVector,
                            "inputColor0": color0,
                            "inputColor1": color1,
                        ]
                    )
            }
        }
        
    }
}