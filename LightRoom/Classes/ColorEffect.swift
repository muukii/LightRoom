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
        public final class CrossPolynomial: FilterComponent {
            
            public required init(
                redCoefficients: Vector10,
                greenCoefficients: Vector10,
                blueCoefficients: Vector10) {
                    
                    super.init(filterName: "CIColorCrossPolynomial", parameters: [
                        "inputRedCoefficients": redCoefficients.CIVector,
                        "inputGreenCoefficients": greenCoefficients.CIVector,
                        "inputBlueCoefficients": blueCoefficients.CIVector,
                        ]
                    )
            }
        }
        
        /**
        CIColorCube
        Uses a three-dimensional color table to transform the source image pixels.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorCube: FilterComponent {
            
            public required init(
                cubeDimension: Double,
                cubeData: NSData) {
                    
                    super.init(filterName: "CIColorCube", parameters: [
                        "inputCubeDimension": cubeDimension,
                        "inputCubeData": cubeData,
                        ]
                    )
            }
        }
        
        /**
        CIColorCubeWithColorSpace
        Uses a three-dimensional color table to transform the source image pixels and maps the result to a specified color space.
        
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class ColorCubeWithColorSpace: FilterComponent {
            
            public required init(
                cubeDimension: Double,
                cubeData: NSData,
                colorSpace: CGColorSpaceRef) {
                    
                    super.init(filterName: "CIColorCubeWithColorSpace", parameters: [
                        "inputCubeDimension": cubeDimension,
                        "inputCubeData": cubeData,
                        "inputColorSpace": colorSpace,
                        ]
                    )
            }
        }
        
        /**
        CIColorInvert
        Inverts the colors in an image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorInvert: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIColorInvert", parameters: [:])
            }
        }
        
        /**
        CIColorMap
        Performs a nonlinear transformation of source color values using mapping values provided in a table.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorMap: FilterComponent {
            
            public required init(gradientImage: CIImage) {
                    
                    super.init(filterName: "CIColorMap", parameters: [
                        "inputGradientImage": gradientImage,
                        ]
                    )
            }
        }
        
        /**
        CIColorMonochrome
        Remaps colors so they fall within shades of a single color.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorMonochrome: FilterComponent {
            
            public required init(color: CIColor, intensity: Double) {
                
                super.init(filterName: "CIColorMonochrome", parameters: [
                    kCIInputColorKey: color,
                    "inputIntensity": intensity,
                    ]
                )
            }
        }
        
        /**
        CIColorPosterize
        Remaps red, green, and blue color components to the number of brightness values you specify for each color component.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class CIColorPosterize: FilterComponent {
            
            public required init(levels: Double) {
                
                super.init(filterName: "CIColorPosterize", parameters: [
                    "input": levels,
                    ]
                )
            }
        }
        
        /**
        CIFalseColor
        Maps luminance to a color ramp of two colors.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class FalseColor: FilterComponent {
            
            public required init(color0: CIColor, color1: CIColor) {
                
                super.init(filterName: "CIFalseColor", parameters: [
                    "inputColor0": color0,
                    "inputColor1": color1,
                    ]
                )
            }
        }
        
        /**
        CIMaskToAlpha
        Converts a grayscale image to a white image that is masked by alpha.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class MaskToAlpha: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIMaskToAlpha", parameters: [:])
            }
        }

        
        /**
        CIMaximumComponent
        Returns a grayscale image from max(r,g,b).
        */
        @available(iOS 6.0, OSX 10.5, *)
        public final class MaximumComponent: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIMaximumComponent", parameters: [:])
            }
        }
        
        /**
        CIMinimumComponent
        Returns a grayscale image from min(r,g,b).
        */
        @available(iOS 6.0, OSX 10.5, *)
        public final class MinimumComponent: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIMinimumComponent", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectChrome
        Applies a preconfigured set of effects that imitate vintage photography film with exaggerated color.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectChrome: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectChrome", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectFade
        Applies a preconfigured set of effects that imitate vintage photography film with diminished color.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectFade: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectFade", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectInstant
        Applies a preconfigured set of effects that imitate vintage photography film with distorted colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectInstant: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectInstant", parameters: [:])
            }
        }
        
        
        /**
        CIPhotoEffectMono
        Applies a preconfigured set of effects that imitate black-and-white photography film with low contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectMono: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectMono", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectNoir
        Applies a preconfigured set of effects that imitate black-and-white photography film with exaggerated contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectNoir: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectNoir", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectProcess
        Applies a preconfigured set of effects that imitate vintage photography film with emphasized cool colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectProcess: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectProcess", parameters: [:])
            }
        }
        
        
        /**
        CIPhotoEffectTonal
        Applies a preconfigured set of effects that imitate black-and-white photography film without significantly altering contrast.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectTonal: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectTonal", parameters: [:])
            }
        }
        
        /**
        CIPhotoEffectTransfer
        Applies a preconfigured set of effects that imitate vintage photography film with emphasized warm colors.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class PhotoEffectTransfer: FilterComponent {
            
            public required init() {
                
                super.init(filterName: "CIPhotoEffectTransfer", parameters: [:])
            }
        }
        
        /**
        CISepiaTone
        Maps the colors of an image to various shades of brown.
        */
        @available(iOS 5.0, OSX 10.4, *)
        public final class SepiaTone: FilterComponent {
            
            public required init(intencity: Double) {
                
                super.init(filterName: "CISepiaTone", parameters: [
                    kCIInputIntensityKey: intencity,
                    ])
            }
        }
        
        /**
        CIVignette
        Reduces the brightness of an image at the periphery.
        */
        @available(iOS 5.0, OSX 10.9, *)
        public final class Vignette: FilterComponent {
            
            public required init(radius: Double, intencity: Double) {
                
                super.init(filterName: "CIVignette", parameters: [
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    ])
            }
        }
        
        /**
        CIVignetteEffect
        Modifies the brightness of an image around the periphery of a specified region.
        */
        @available(iOS 7.0, OSX 10.9, *)
        public final class VignetteEffect: FilterComponent {
            
            public required init(center: Vector2, radius: Double, intencity: Double) {
                
                super.init(filterName: "CIVignetteEffect", parameters: [
                    kCIInputCenterKey: center.CIVector,
                    kCIInputRadiusKey: radius,
                    kCIInputIntensityKey: intencity,
                    ])
            }
        }
    }
}