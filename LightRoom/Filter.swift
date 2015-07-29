//
//  Filter.swift
//  LightRoom
//
//  Created by Muukii on 7/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import QuartzCore

public typealias Filter = CIImage -> CIImage

infix operator >>> { associativity left }
public func >>> (filter1: Filter, filter2: Filter) -> Filter {
    return { image in filter2(filter1(image)) }
}

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
        public static func boxBlur(#radius: Double) -> Filter {
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
        public static func discBlur(#radius: Double) -> Filter {
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
        public static func gaussianBlur(#radius: Double) -> Filter {
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
        @available(OSX 10.10, *)
        CIMaskedVariableBlur
        
        Blurs the source image according to the brightness levels in a mask image.
        
        :param: mask
        :param: radius
        
        :returns:
        */
        public static func maskedVariableBlur(#mask: CIImage, radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputMaskImageKey: mask,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMaskedVariableBlur", withInputParameters: parameters)
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
        public static func motionBlur(#radius: Double, angle: Double) -> Filter {
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
        
        :param: noiseLevel Default value: 0.02
        :param: sharpness Default value: 0.40
        
        :returns:
        */
        public static func noiseReduction(#noiseLevel: Double, sharpness: Double) -> Filter {
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
        
        :param: center Default value: [150 150]
        :param: amount Default value: 20.00
        
        :returns:
        */
        public static func zoomBlur(#center: CIVector, amount: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputCenterKey: center,
                    "inputAmount": amount,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIZoomBlur", withInputParameters: parameters)
                return filter!.outputImage
            }
        }
    }
}