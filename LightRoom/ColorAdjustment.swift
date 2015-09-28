//
//  ColorAdjustment.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import SwiftyJSON

public extension LightRoom {
    /*!
    CICategoryColorAdjustment
    */
    public struct ColorAdjustment {
        
        /*!
        CIColorClamp
        
        :param: minComponents
        :param: maxComponents
        
        :returns:
        */
        @available(iOS 7.0, OSX 10.9, *)
        public class ColorClamp: CIFilterGen, FilterJSONConvertible {
            
            public required init(minComponents: Vector4,
                maxComponents: Vector4) {
                
                super.init(filterName: "CIColorClamp", parameters: [
                        "inputMinComponents": minComponents.CIVector,
                        "inputMaxComponents": maxComponents.CIVector,
                    ]
                )
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
        public class ColorControls: CIFilterGen, FilterJSONConvertible {
            
            public required init(saturation: Double = 1,
                brightness: Double = 0,
                contrast: Double = 1) {
                    
                    super.init(filterName: "CIColorControls", parameters: [
                        kCIInputSaturationKey: saturation,
                        kCIInputBrightnessKey: brightness,
                        kCIInputContrastKey: contrast,
                        ]
                    )
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
        public class ColorMatrix: CIFilterGen, FilterJSONConvertible {
            
            public required init(
                rVector: Vector4,
                gVector: Vector4,
                bVector: Vector4,
                aVector: Vector4,
                biasVector: Vector4) {
                    
                    super.init(filterName: "CIColorMatrix", parameters: [
                        "inputRVector": rVector.CIVector,
                        "inputGVector": gVector.CIVector,
                        "inputBVector": bVector.CIVector,
                        "inputAVector": aVector.CIVector,
                        "inputBiasVector": biasVector.CIVector,
                        ]
                    )
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
        public class ColorPolynomial: CIFilterGen, FilterJSONConvertible {
            
            public required init(
                redCoefficients: Vector4,
                greenCoefficients: Vector4,
                blueCoefficients: Vector4,
                alphaCoefficients: Vector4) {
                    
                    super.init(filterName: "CIColorPolynomial", parameters: [
                        "inputRedCoefficients": redCoefficients.CIVector,
                        "inputGreenCoefficients": greenCoefficients.CIVector,
                        "inputBlueCoefficients": blueCoefficients.CIVector,
                        "inputAlphaCoefficients": alphaCoefficients.CIVector,
                        ]
                    )
            }
        }
        
        /**
        CIExposureAdjust
        
        Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.
        
        :param: ev
        
        */
        @available(iOS 5, OSX 10.4, *)
        public class ExposureAdjust: CIFilterGen, FilterJSONConvertible {
            
            public required init(ev: Double) {
                    
                    super.init(filterName: "CIExposureAdjust", parameters: [
                        kCIInputEVKey: ev,
                        ]
                    )
            }
        }
        
        /**
        CIGammaAdjust
        
        Adjusts midtone brightness.
        
        :param: power
        */
        @available(iOS 5.0, OSX 10.4, *)
        public class GammmaAdjust: CIFilterGen, FilterJSONConvertible {
            
            public required init(power: Double) {
                
                super.init(filterName: "CIGammaAdjust", parameters: [
                    "inputPower": power,
                    ]
                )
            }
        }
        
        /**
        CIHueAdjust
        
        Changes the overall hue, or tint, of the source pixels.
        
        :param: angle
        */
        @available(iOS 5.0, OSX 10.4, *)
        public class HueAdjust: CIFilterGen, FilterJSONConvertible {
            
            public required init(angle: Double) {
                
                super.init(filterName: "CIHueAdjust", parameters: [
                    kCIInputAngleKey: angle,
                    ]
                )
            }
        }
        
        /**
        CILinearToSRGBToneCurve
        
        Maps color intensity from a linear gamma curve to the sRGB color space.
        */
        @available(iOS 7.0, OSX 10.10, *)
        public class LinerToSRGBToneCurve: CIFilterGen, FilterJSONConvertible {
            
            public required init() {
                
                super.init(filterName: "CILinearToSRGBToneCurve", parameters: [:])
            }
        }
        
        /**
        CISRGBToneCurveToLinear
        Maps color intensity from the sRGB color space to a linear gamma curve.
        */
        @available(iOS 7.0, OSX 10.10, *)
        public class SRGBToneCurveToLinear: CIFilterGen, FilterJSONConvertible {
            
            public required init() {
                
                super.init(filterName: "CISRGBToneCurveToLinear", parameters: [:])
            }
        }
        
        /**
        CITemperatureAndTint
        
        Adapts the reference white point for an image.
        
        :param: neutral
        :param: targetNeutral
        */
        @available(iOS 5.0, OSX 10.7, *)
        public class TemperatureAndTint: CIFilterGen, FilterJSONConvertible {
            
            public required init(neutral: Vector2,
                targetNeutral: Vector2) {
                
                super.init(filterName: "CITemperatureAndTint", parameters: [
                        "inputNeutral": neutral.CIVector,
                        "inputTargetNeutral": targetNeutral.CIVector,
                    ]
                )
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
        public class ToneCurve: CIFilterGen, FilterJSONConvertible {
            
            public required init(
                point0: Vector2,
                point1: Vector2,
                point2: Vector2,
                point3: Vector2,
                point4: Vector2) {
                    
                    super.init(
                        filterName: "CIToneCurve",
                        parameters:
                        [
                            "inputPoint0":point0.CIVector,
                            "inputPoint1":point1.CIVector,
                            "inputPoint2":point2.CIVector,
                            "inputPoint3":point3.CIVector,
                            "inputPoint4":point4.CIVector,
                        ]
                    )
            }
        }
        
        /**
        CIVibrance
        
        Adjusts the saturation of an image while keeping pleasing skin tones.
        */
        @available(iOS 5.0, OSX 10.7, *)
        public class Vibrance: CIFilterGen, FilterJSONConvertible {
            
            public required init(amount: Double) {
                    
                    super.init(filterName: "CIVibrance", parameters: [
                        "inputAmount": amount,
                        ]
                    )
            }
        }
        
        /**        
        CIWhitePointAdjust
        
        Adjusts the reference white point for an image and maps all colors in the source using the new reference.
        
        :param: color A CIColor object whose display name is Color.
        */
        @available(iOS 5.0, OSX 10.4, *)
        public class WhitePointAdjust: CIFilterGen, FilterJSONConvertible {
            
            public required init(color: CIColor) {
                
                super.init(filterName: "CIWhitePointAdjust", parameters: [
                    kCIInputColorKey: color,
                    ]
                )
            }
        }
    }
}

public extension LightRoom.ColorAdjustment {
    
    public class RGBToneCurve: FilterGen {
        
        public var filterName: String {
            return "RGBToneCurve"
        }
        
        let rPoints: [Vector2]
        let gPoints: [Vector2]
        let bPoints: [Vector2]
        let rgbPoints: [Vector2]
        
        public required init(rPoints: [Vector2],
            gPoints: [Vector2],
            bPoints: [Vector2],
            rgbPoints: [Vector2]) {
                
                self.rPoints = rPoints
                self.gPoints = gPoints
                self.bPoints = bPoints
                self.rgbPoints = rgbPoints
        }
        
        public var filter: Filter {
            
            return { image in
                
                let rImage = LightRoom.ColorAdjustment.ToneCurve(
                    point0: self.rPoints[0],
                    point1: self.rPoints[1],
                    point2: self.rPoints[2],
                    point3: self.rPoints[3],
                    point4: self.rPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                        rVector: [1,0,0,0],
                        gVector: [0,0,0,0],
                        bVector: [0,0,0,0],
                        aVector: [0,0,0,1],
                        biasVector: [0,0,0,0]).filter(image))
                
                let gImage = LightRoom.ColorAdjustment.ToneCurve(
                    point0: self.gPoints[0],
                    point1: self.gPoints[1],
                    point2: self.gPoints[2],
                    point3: self.gPoints[3],
                    point4: self.gPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                        rVector: [0,0,0,0],
                        gVector: [0,1,0,0],
                        bVector: [0,0,0,0],
                        aVector: [0,0,0,1],
                        biasVector: [0,0,0,0]).filter(image))
                
                let bImage = LightRoom.ColorAdjustment.ToneCurve(
                    point0: self.bPoints[0],
                    point1: self.bPoints[1],
                    point2: self.bPoints[2],
                    point3: self.bPoints[3],
                    point4: self.bPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                        rVector: [0,0,0,0],
                        gVector: [0,0,0,0],
                        bVector: [0,0,1,0],
                        aVector: [0,0,0,1],
                        biasVector: [0,0,0,0]).filter(image))
                
                let screenBlend = LightRoom.CompositeOperation.lightenBlendMode()
                
                let blendImage = screenBlend(
                    image: screenBlend(image: rImage, backgroundImage: bImage),
                    backgroundImage: gImage)
                
                return LightRoom.ColorAdjustment.ToneCurve(
                    point0: self.rgbPoints[0],
                    point1: self.rgbPoints[1],
                    point2: self.rgbPoints[2],
                    point3: self.rgbPoints[3],
                    point4: self.rgbPoints[4]).filter(blendImage)
            }
        }
        
        public var json: JSON {
            
            return JSON([ : ])
        }
    }
}