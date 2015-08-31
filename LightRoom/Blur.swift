//
//  Blur.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    /*!
    CICategoryBlur
    */
    public enum Blur {
        
        /*!
        CIBoxBlur
        Blurs an image using a box-shaped convolution kernel.
        
        :param: radius
        
        :returns: Filter
        */
        @available(iOS 9.0, OSX 10.5, *)
        public static func boxBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIBoxBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CIDiscBlur
        
        Blurs an image using a disc-shaped convolution kernel.
        
        :param: radius
        
        :returns: Filter
        */
        @available(iOS 9.0, OSX 10.5, *)
        public static func discBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIDiscBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CIGaussianBlur
        
        Spreads source pixels by an amount specified by a Gaussian distribution.
        
        :param: radius
        
        :returns:
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func gaussianBlur(radius radius: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CIMedianFilter
        
        Discussion
        The effect is to reduce noise.
        
        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public static func medianBlur() -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMedianFilter", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CIMotionBlur
        
        Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image.
        
        :param: radius
        :param: angle
        
        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public static func motionBlur(radius radius: Double, angle: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputAngleKey: angle,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMotionBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CINoiseReduction
        
        :param: noiseLevel
        :param: sharpness
        
        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public static func noiseReduction(noiseLevel noiseLevel: Double = 0.02, sharpness: Double = 0.40) -> Filter {
            return { image in
                
                let parameters = [
                    "inputNoizeLevel": noiseLevel,
                    kCIInputSharpnessKey: sharpness,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CINoiseReductionBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /*!
        CIZoomBlur
        
        Simulates the effect of zooming the camera while capturing the image.
        
        :param: center
        :param: amount
        
        :returns:
        */
        @available(iOS 9.0, OSX 10.4, *)
        public static func zoomBlur(center center: Vector2, amount: Double) -> Filter {
            return { image in
                
                let parameters = [
                    kCIInputCenterKey: center.CIVector,
                    "inputAmount": amount,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIZoomBlur", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
    

}