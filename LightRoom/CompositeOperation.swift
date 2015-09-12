//
//  CompositeOperation.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import Foundation

public typealias Composite = (image: CIImage, backgroundImage: CIImage) -> CIImage

public extension LightRoom {
    
    /**
    CICategoryCompositeOperation
    */
    public enum CompositeOperation {
        
        /**
        CIAdditionCompositing
        Adds color components to achieve a brightening effect.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func additionCompositing() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIAdditionCompositing", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIColorBlendMode
        Uses the luminance values of the background with the hue and saturation values of the source image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIColorBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIColorBurnBlendMode
        Darkens the background image samples to reflect the source image samples.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorBurnBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIColorBurnBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIColorDodgeBlendMode
        Brightens the background image samples to reflect the source image samples.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func colorDodgeBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIColorDodgeBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIDarkenBlendMode
        Creates composite image samples by choosing the darker samples (from either the source image or the background).
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func darkenBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIDarkenBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIDifferenceBlendMode
        Subtracts either the source image sample color from the background image sample color, or the reverse, depending on which sample has the greater brightness value.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func differenceBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIDifferenceBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIDivideBlendMode
        Divides the background image sample color from the source image sample color.
        */
        @available(iOS 8.0, OSX 10.10, *)
        public static func divideBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIDivideBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIExclusionBlendMode
        Produces an effect similar to that produced by the CIDifferenceBlendMode filter but with lower contrast.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func exclusionBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIExclusionBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIHardLightBlendMode
        Either multiplies or screens colors, depending on the source image sample color.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func hardLightBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIHardLightBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CIHueBlendMode
        Uses the luminance and saturation values of the background image with the hue of the input image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func hueBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CIHueBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CILightenBlendMode
        Creates composite image samples by choosing the lighter samples (either from the source image or the background).
        */
        @available(iOS 6.0, OSX 10.4, *)
        public static func lightenBlendMode() -> Composite {
            return { image, backgroundImage in
                
                let parameters = [
                    
                    kCIInputImageKey: image,
                    kCIInputBackgroundImageKey: backgroundImage
                ]
                
                let filter = CIFilter(name: "CILightenBlendMode", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}