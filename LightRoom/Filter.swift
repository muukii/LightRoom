//
//  Filter.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import QuartzCore

/** 
About Core Image
https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_intro/ci_intro.html

Filters
https://developer.apple.com/library/prerelease/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html
*/
public enum Filters {
    
    /*!
    CICategoryBlur
    */
    public enum Blur {
        
        /*!
        CIBoxBlur
        
        @available(iOS 9.0, OSX 10.5, *)
        
        Blurs an image using a box-shaped convolution kernel.
        
        :param: radius
        
        :returns: Filter
        */
        public static func boxBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIBoxBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 9.0, OSX 10.5, *)
        
        CIDiscBlur
        
        Blurs an image using a disc-shaped convolution kernel.
        
        :param: radius
        
        :returns: Filter
        */
        public static func discBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIDiscBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 6.0, OSX 10.4, *)

        CIGaussianBlur
        
        Spreads source pixels by an amount specified by a Gaussian distribution.
        
        :param: radius
        
        :returns:
        */
        public static func gaussianBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 9.0, OSX 10.4, *)

        CIMedianFilter
        
        Discussion
        The effect is to reduce noise.
        
        :returns:
        */
        public static func medianBlur() -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMedianFilter", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 9.0, OSX 10.4, *)
        
        CIMotionBlur
        
        Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.
        
        :param: radius
        :param: angle
        
        :returns:
        */
        public static func motionBlur(radius radius: Double, angle: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputAngleKey: angle,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMotionBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 9.0, OSX 10.4, *)
        
        CINoiseReduction
        
        :param: noiseLevel
        :param: sharpness
        
        :returns:
        */
        public static func noiseReduction(noiseLevel: Double = 0.02, sharpness: Double = 0.40) -> Filter {
            return { image in
                
                let parameters = [
                    "inputNoizeLevel": noiseLevel,
                    kCIInputSharpnessKey: sharpness,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CINoiseReductionBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS9, OSX 10.4, *)
        
        CIZoomBlur
        
        Simulates the effect of zooming the camera while capturing the image.
        
        :param: center
        :param: amount
        
        :returns:
        */
        public static func zoomBlur(center: Vector = [150,150], amount: Double = 20) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputCenterKey: center.CIVector,
                    "inputAmount": amount,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIZoomBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
    }
    
    /*!
    CICategoryColorAdjustment
    */
    public enum ColorAdjustment {
        
        /*!
        @available(iOS 7.0, OSX 10.9, *)
        
        CIColorClamp
        
        :param: minComponents
        :param: maxComponents
        
        :returns:
        */
        public static func colorClamp(
            minComponents: Vector = [0,0,0,0],
            maxComponents: Vector = [0,0,0,0]) -> Filter {
                
            return { image in
                
                let parameters = [
                    "inputMinComponents": minComponents.CIVector,
                    "inputMaxComponents": maxComponents.CIVector,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIColorClamp", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
        
        /*!
        @available(iOS 5.0, OSX 10.9, *)
        
        CIColorControls
        
        Adjusts saturation, brightness, and contrast values.
        
        :param: saturation
        :param: brightness
        :param: contrast
        
        :returns:
        */
        public static func colorControls(
            saturation: Double = 1,
            brightness: Double = 1,
            contrast: Double = 1) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        kCIInputSaturationKey: saturation,
                        kCIInputBrightnessKey: brightness,
                        kCIInputContrastKey: contrast,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorControls", withInputParameters: parameters)
                    return filter!.outputImage
                }
        }
        
        /*!
        @available(iOS 5.0, OSX 10.4, *)
        
        CIColorMatrix
        
        Multiplies source color values and adds a bias factor to each color component.
        
        :param: rVector
        :param: gVector
        :param: bVector
        :param: aVector
        
        :returns:
        */
        public static func colorMatrix(
            rVector: Vector = [1,0,0,0],
            gVector: Vector = [0,1,0,0],
            bVector: Vector = [0,0,1,0],
            aVector: Vector = [0,0,0,1]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputRVector": rVector.CIVector,
                        "inputGVector": gVector.CIVector,
                        "inputBVector": bVector.CIVector,
                        "inputAVector": aVector.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorMatrix", withInputParameters: parameters)
                    return filter!.outputImage
                }
        }
        
        /*!
        @available(iOS 7.0, OSX 10.9, *)
        
        CIColorPolynomial
        Modifies the pixel values in an image by applying a set of cubic polynomials.
        
        :param: redCoefficients  
        :param: greenCoefficients
        :param: blueCoefficients
        :param: alphaCoefficients
        
        :returns:
        */
        public static func colorPolynomial(
            redCoefficients: Vector = [0,1,0,0],
            greenCoefficients: Vector = [0,1,0,0],
            blueCoefficients: Vector = [0,1,0,0],
            alphaCoefficients: Vector = [0,1,0,0]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputRedCoefficients": redCoefficients.CIVector,
                        "inputGreenCoefficients": greenCoefficients.CIVector,
                        "inputBlueCoefficients": blueCoefficients.CIVector,
                        "inputAlphaCoefficients": alphaCoefficients.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorPolynomial", withInputParameters: parameters)
                    return filter!.outputImage
                }
        }
        
    }
}