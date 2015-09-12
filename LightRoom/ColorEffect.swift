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
            redCoefficients redCoefficients: Vector10,
            greenCoefficients: Vector10,
            blueCoefficients: Vector10) -> Filter {
                
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
            cubeDimension cubeDimension: Double,
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
            cubeDimension cubeDimension: Double,
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
        
        /**
        CIColorMonochrome
        Remaps colors so they fall within shades of a single color.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorMonochrome(color color: CIColor, intencity: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputColorKey: color,
                    "inputIntencity": intencity,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIColorMonochrome", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIColorPosterize
        Remaps red, green, and blue color components to the number of brightness values you specify for each color component.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorPosterize(levels levels: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    "input": levels,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIColorPosterize", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIFalseColor
        Maps luminance to a color ramp of two colors.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func falseColor(color0 color0: CIColor, color1: CIColor) -> Filter {
            
            return { image in
                
                let parameters = [
                    "inputColor0": color0,
                    "inputColor1": color1,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIFalseColor", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIMaskToAlpha
        Converts a grayscale image to a white image that is masked by alpha.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func maskToAlpha() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMaskToAlpha", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIMaximumComponent
        Returns a grayscale image from max(r,g,b).
        */
        @available(iOS 6.0, OSX 10.5, *)
        public static func maximumComponent() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMaximumComponent", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIMinimumComponent
        Returns a grayscale image from min(r,g,b).
        */
        @available(iOS 6.0, OSX 10.5, *)
        public static func minimumComponent() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIMinimumComponent", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectChrome
        Applies a preconfigured set of effects that imitate vintage photography film with exaggerated color.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectChrome() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectChrome", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectFade
        Applies a preconfigured set of effects that imitate vintage photography film with diminished color.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectFade() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectFade", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectInstant
        Applies a preconfigured set of effects that imitate vintage photography film with distorted colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectInstant() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectInstant", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectMono
        Applies a preconfigured set of effects that imitate black-and-white photography film with low contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectMono() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectMono", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectNoir
        Applies a preconfigured set of effects that imitate black-and-white photography film with exaggerated contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectNoir() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectNoir", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectProcess
        Applies a preconfigured set of effects that imitate vintage photography film with emphasized cool colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectProcess() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectProcess", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectTonal
        Applies a preconfigured set of effects that imitate black-and-white photography film without significantly altering contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectTonal() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectTonal", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIPhotoEffectTransfer
        Applies a preconfigured set of effects that imitate vintage photography film with emphasized warm colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func photoEffectTransfer() -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIPhotoEffectTransfer", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CISepiaTone
        Maps the colors of an image to various shades of brown.
        */
        @available(iOS 5.0, OSX 10.4, *)
        public static func sepiaTone(intencity intencity: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputIntensityKey: intencity,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CISepiaTone", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIVignette
        Reduces the brightness of an image at the periphery.
        */
        @available(iOS 5.0, OSX 10.9, *)
        public static func vignette(radius radius: Double, intencity: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIVignette", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIVignetteEffect
        Modifies the brightness of an image around the periphery of a specified region.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public static func vignetteEffect(center center: Vector2, radius: Double, intencity: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputCenterKey: center.CIVector,
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    kCIInputImageKey: image,
                ]
                let filter = CIFilter(name: "CIVignetteEffect", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
    }
}