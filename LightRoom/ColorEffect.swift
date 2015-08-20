//
//  ColorEffect.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    /**
    CICategoryColorEffect
    */
    public enum ColorEffect {
        
        /**
        CIColorCrossPolynomial
        
        Modifies the pixel values in an image by applying a set of polynomial cross-products.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func crossPolynomial(
            redCoefficients redCoefficients: Vector = [1,0,0,0,0,0,0,0,0,0],
            greenCoefficients: Vector = [0,1,0,0,0,0,0,0,0,0],
            blueCoefficients: Vector = [0,0,1,0,0,0,0,0,0,0]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputRedCoefficients": redCoefficients.CIVector,
                        "inputGreenCoefficients": greenCoefficients.CIVector,
                        "inputBlueCoefficients": blueCoefficients.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorCrossPolynomial", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CIColorCube
        Uses a three-dimensional color table to transform the source image pixels.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorCube(
            cubeDimension cubeDimension: Double = 2.00,
            cubeData: NSData) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputCubeDimension": cubeDimension,
                        "inputCubeData": cubeData,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorCube", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CIColorCubeWithColorSpace
        Uses a three-dimensional color table to transform the source image pixels and maps the result to a specified color space.
        
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func colorCubeWithColorSpace(
            cubeDimension cubeDimension: Double = 2.00,
            cubeData: NSData,
            colorSpace: CGColorSpaceRef) -> Filter {
                
                return { image in
                    
                    let parameters: [String : AnyObject] = [
                        "inputCubeDimension": cubeDimension,
                        "inputCubeData": cubeData,
                        "inputColorSpace": colorSpace,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorCubeWithColorSpace", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CIColorInvert
        Inverts the colors in an image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorInvert() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIColorInvert", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIColorMap
        Performs a nonlinear transformation of source color values using mapping values provided in a table.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorMap(gradientImage gradientImage: CIImage) -> Filter {
            
            return { image in
                
                let parameters = [
                    "inputGradientImage": gradientImage,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIColorMap", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}