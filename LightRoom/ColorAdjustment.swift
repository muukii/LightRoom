//
//  ColorAdjustment.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    /*!
    CICategoryColorAdjustment
    */
    public enum ColorAdjustment {
        
        /*!
        CIColorClamp
        
        :param: minComponents
        :param: maxComponents
        
        :returns:
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func colorClamp(
            minComponents minComponents: Vector = [0,0,0,0],
            maxComponents: Vector = [0,0,0,0]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputMinComponents": minComponents.CIVector,
                        "inputMaxComponents": maxComponents.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorClamp", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /*!
        CIColorControls
        
        Adjusts saturation, brightness, and contrast values.
        
        :param: saturation
        :param: brightness
        :param: contrast
        
        :returns:
        */
        @available(iOS 5.0, OSX 10.9, *)
        public static func colorControls(
            saturation saturation: Double = 1,
            brightness: Double = 0,
            contrast: Double = 1) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        kCIInputSaturationKey: saturation,
                        kCIInputBrightnessKey: brightness,
                        kCIInputContrastKey: contrast,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIColorControls", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /*!
        CIColorMatrix
        
        Multiplies source color values and adds a bias factor to each color component.
        
        :param: rVector
        :param: gVector
        :param: bVector
        :param: aVector
        
        :returns:
        */
        @available(iOS 5.0, OSX 10.4, *)
        public static func colorMatrix(
            rVector rVector: Vector = [1,0,0,0],
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
                    return filter!.outputImage!
                }
        }
        
        /*!
        CIColorPolynomial
        Modifies the pixel values in an image by applying a set of cubic polynomials.
        
        :param: redCoefficients
        :param: greenCoefficients
        :param: blueCoefficients
        :param: alphaCoefficients
        
        :returns:
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func colorPolynomial(
            redCoefficients redCoefficients: Vector = [0,1,0,0],
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
                    return filter!.outputImage!
                }
        }
        
        /**
        CIExposureAdjust
        
        Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
        
        :param: ev
        
        */
        @available(iOS 5, OSX 10.4, *)
        public static func exposureAdjust(ev ev: Double = 0.5) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputEVKey: ev,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIExposureAdjust", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIGammaAdjust
        
        Adjusts midtone brightness.
        
        :param: power
        */
        @available(iOS 5.0, OSX 10.4, *)
        public static func gammaAdjust(power power: Double = 0.75) -> Filter {
            
            return { image in
                
                let parameters = [
                    "inputPower": power,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIGammaAdjust", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIHueAdjust
        
        Changes the overall hue, or tint, of the source pixels.
        
        :param: angle
        */
        @available(iOS 5.0, OSX 10.4, *)
        public static func hueAdjust(angle angle: Double = 0) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputAngleKey: angle,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIHueAdjust", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CILinearToSRGBToneCurve
        
        Maps color intensity from a linear gamma curve to the sRGB color space.
        */
        @available(iOS 7.0, OSX 10.10, *)
        public static func linerToSRGBToneCurve() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CILinearToSRGBToneCurve", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CISRGBToneCurveToLinear
        Maps color intensity from the sRGB color space to a linear gamma curve.
        */
        @available(iOS 7.0, OSX 10.10, *)
        public static func sRGBToneCurveToLinear() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CISRGBToneCurveToLinear", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CITemperatureAndTint
        
        Adapts the reference white point for an image.
        
        :param: neutral
        :param: targetNeutral
        */
        @available(iOS 5.0, OSX 10.7, *)
        public static func temperatureAndTint(
            neutral neutral: Vector = [6500,0],
            targetNeutral: Vector = [6500,0]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputNeutral": neutral.CIVector,
                        "inputTargetNeutral": targetNeutral.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CITemperatureAndTint", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CIToneCurve
        
        Adjusts tone response of the R, G, and B channels of an image.
        
        :param: point0
        :param: point1
        :param: point2
        :param: point3
        :param: point4
        */
        @available(iOS 5.0, OSX 10.7, *)
        public static func toneCurve(
            point0 point0: Vector = [0.00,0.00],
            point1: Vector = [0.25,0.25],
            point2: Vector = [0.50,0.50],
            point3: Vector = [0.75,0.75],
            point4: Vector = [1.00,1.00]) -> Filter {
                
                return { image in
                    
                    let parameters = [
                        "inputPoint0": point0.CIVector,
                        "inputPoint1": point1.CIVector,
                        "inputPoint2": point2.CIVector,
                        "inputPoint3": point3.CIVector,
                        "inputPoint4": point4.CIVector,
                        kCIInputImageKey: image,
                    ]
                    let filter = CIFilter(name: "CIToneCurve", withInputParameters: parameters)
                    return filter!.outputImage!
                }
        }
        
        /**
        CIVibrance
        
        Adjusts the saturation of an image while keeping pleasing skin tones.
        */
        @available(iOS 5.0, OSX 10.7, *)
        public static func vibrance(amount: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    "inputAmount": amount,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIVibrance", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**        
        CIWhitePointAdjust
        
        Adjusts the reference white point for an image and maps all colors in the source using the new reference.
        
        :param: color A CIColor object whose display name is Color.
        */
        @available(iOS 5.0, OSX 10.4, *)
        public static func whitePointAdjust(color: CIColor) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputColorKey: color,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIWhitePointAdjust", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}