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
        public final class AdditionCompositing: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIAdditionCompositing")
            }
        }
        /**
        CIColorBlendMode
        Uses the luminance values of the background with the hue and saturation values of the source image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIColorBlendMode")
            }
        }
        
        /**
        CIColorBurnBlendMode
        Darkens the background image samples to reflect the source image samples.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorBurnBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIColorBurnBlendMode")
            }
        }
        
        /**
        CIColorDodgeBlendMode
        Brightens the background image samples to reflect the source image samples.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ColorDodgeBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIColorDodgeBlendMode")
            }
        }
        
        /**
        CIDarkenBlendMode
        Creates composite image samples by choosing the darker samples (from either the source image or the background).
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class DarkenBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIDarkenBlendMode")
            }
        }
        
        /**
        CIDifferenceBlendMode
        Subtracts either the source image sample color from the background image sample color, or the reverse, depending on which sample has the greater brightness value.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class DifferenceBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIDifferenceBlendMode")
            }
        }
        
        /**
        CIDivideBlendMode
        Divides the background image sample color from the source image sample color.
        */
        @available(iOS 8.0, OSX 10.10, *)
        public final class DivideBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIDivideBlendMode")
            }
        }
        
        /**
        CIExclusionBlendMode
        Produces an effect similar to that produced by the CIDifferenceBlendMode filter but with lower contrast.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ExclusionBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIExclusionBlendMode")
            }
        }
        
        /**
        CIHardLightBlendMode
        Either multiplies or screens colors, depending on the source image sample color.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class HardLightBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIHardLightBlendMode")
            }
        }
        
        /**
        CIHueBlendMode
        Uses the luminance and saturation values of the background image with the hue of the input image.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class HueBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIHueBlendMode")
            }
        }
        
        /**
        CILightenBlendMode
        Creates composite image samples by choosing the lighter samples (either from the source image or the background).
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class LightenBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CILightenBlendMode")
            }
        }
        
        /**
        CILinearBurnBlendMode
        Darkens the background image samples to reflect the source image samples while also increasing contrast.
        */
        @available(iOS 8.0, OSX 10.4, *)
        public final class LinearBurnBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CILinearBurnBlendMode")
            }
        }
        
        /**
        CILinearDodgeBlendMode
        Brightens the background image samples to reflect the source image samples while also increasing contrast.
        */
        @available(iOS 8.0, OSX 10.4, *)
        public final class LinearDodgeBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CILinearDodgeBlendMode")
            }
        }
        
        /**
        CILuminosityBlendMode
        Uses the hue and saturation of the background image with the luminance of the input image.
        */
        /**
        CIMaximumCompositing
        Computes the maximum value, by color component, of two input images and creates an output image using the maximum values.
        */
        /**
        CIMinimumCompositing
        Computes the minimum value, by color component, of two input images and creates an output image using the minimum values.
        */
        /**
        CIMultiplyBlendMode
        Multiplies the input image samples with the background image samples.
        */
        /**
        CIMultiplyCompositing
        Multiplies the color component of two input images and creates an output image using the multiplied values.
        */
        /**
        CIOverlayBlendMode
        Either multiplies or screens the input image samples with the background image samples, depending on the background color.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class OverlayBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIOverlayBlendMode")
            }
        }
      
        /**
        CIPinLightBlendMode
        Conditionally replaces background image samples with source image samples depending on the brightness of the source image samples.
        */
        /**
        CISaturationBlendMode
        Uses the luminance and hue values of the background image with the saturation of the input image.
        

        */
        /**
        CIScreenBlendMode
        Multiplies the inverse of the input image samples with the inverse of the background image samples.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class ScreenBlendMode: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CIScreenBlendMode")
            }
        }

        /**
        CISoftLightBlendMode
        Either darkens or lightens colors, depending on the input image sample color.
        

        */
        /**
        CISourceAtopCompositing
        Places the input image over the background image, then uses the luminance of the background image to determine what to show.
        */
        @available(iOS 6.0, OSX 10.4, *)
        public final class SourceAtopCompositing: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CISourceAtopCompositing")
            }
        }

        /**
        CISourceInCompositing
        Uses the background image to define what to leave in the input image, effectively cropping the input image.
        

        */
        /**
        CISourceOutCompositing
        Uses the background image to define what to take out of the input image.
        

        */
        /**
        
        CISourceOverCompositing
        Places the input image over the input background image.
        */
        @available(iOS 5.0, OSX 10.4, *)
        public final class SourceOverCompositing: CompositionFilterComponent {
            public required init() {
                super.init(filterName: "CISourceOverCompositing")
            }
        }
        
        /**
        CISubtractBlendMode
        Subtracts the background image sample color from the source image sample color.
        

        */
        
    }
}