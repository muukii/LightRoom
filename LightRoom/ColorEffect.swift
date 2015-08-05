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
                    return filter!.outputImage
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
                    return filter!.outputImage
                }
        }
    }
}