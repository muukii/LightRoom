//
//  DistortionEffect.swift
//  LightRoom
//
//  Created by Muukii on 8/4/15.
//  Copyright (c) 2015 muukii. All rights reserved.
//

import CoreImage

/// https://developer.apple.com/library/prerelease/mac/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/uid/TP30000136-SW118
public extension LightRoom {
    
    /**
    CICategoryDistortionEffect
    */
    public enum DistortionEffect {
        
        /**
         CIBumpDistortion
         Creates a bump that originates at a specified point in the image.
         */
        @available(iOS 7.0, OSX 10.4, *)
        public final class BumpDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double, scale: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputScale"] = scale
                super.init(filterName: "CIBumpDistortion", parameters: parameters)
            }
        }
        
        /**
         CIBumpDistortionLinear
         Creates a concave or convex distortion that originates from a line in the image.
         */
        @available(OSX 10.5, *)
        public final class BumpDistortionLinear: FilterComponent {
            
            public required init(center: Vector2, radius: Double, angle: Double, scale: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputAngle"] = angle
                parameters["inputScale"] = scale
                super.init(filterName: "CIBumpDistortionLinear", parameters: parameters)
            }
        }
        
        /**
         CICircleSplashDistortion
         Distorts the pixels starting at the circumference of a circle and emanating outward.
         */
        @available(OSX 10.5, *)
        public final class CircleSplashDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                super.init(filterName: "CICircleSplashDistortion", parameters: parameters)
            }
        }
        
        /**
         CICircularWrap
         Wraps an image around a transparent circle.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class CircularWrap: FilterComponent {
            
            public required init(center: Vector2, radius: Double, angle: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputAngle"] = angle
                super.init(filterName: "CICircularWrap", parameters: parameters)
            }
        }
        
        /**
         CIDroste
         Recursively draws a portion of an image in imitation of an M. C. Escher drawing.
         */
        @available(iOS 9.0, OSX 10.6, *)
        public final class Droste: FilterComponent {
            
            public required init(insetPoint0: Vector2, insetPoint1: Vector2, strands: Double, periodicity: Double, rotation: Double, zoom: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputInsetPoint0"] = insetPoint0.CIVector
                parameters["inputInsetPoint1"] = insetPoint1.CIVector
                parameters["inputStrands"] = strands
                parameters["inputPeriodicity"] = periodicity
                parameters["inputRotation"] = rotation
                parameters["inputZoom"] = zoom
                super.init(filterName: "CIDroste", parameters: parameters)
            }
        }
        
        /**
         CIDisplacementDistortion
         Applies the grayscale values of the second image to the first image.
         */
        @available(iOS 9.0, OSX 10.4, *)
        public final class DisplacementDistortion: FilterComponent {
            
            public required init(displacementImage: CIImage, scale: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputDisplacementImage"] = displacementImage
                parameters["inputScale"] = scale
                super.init(filterName: "CIDisplacementDistortion", parameters: parameters)
            }
        }
        
        /**
         CIGlassDistortion
         Distorts an image by applying a glass-like texture.
         */
        @available(iOS 8.0, OSX 10.4, *)
        public final class GlassDistortion: FilterComponent {
            
            public required init(texture: CIImage, center: Vector2, scale: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputTexture"] = texture
                parameters["inputCenter"] = center.CIVector
                parameters["inputScale"] = scale
                super.init(filterName: "CIGlassDistortion", parameters: parameters)
            }
        }
        
        /**
         CIGlassLozenge
         Creates a lozenge-shaped lens and distorts the portion of the image over which the lens is placed.
         */
        @available(iOS 9.0, OSX 10.4, *)
        public final class GlassLozenge: FilterComponent {
            
            public required init(point0: Vector2, point1: Vector2, radius: Double, refraction: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputPoint0"] = point0.CIVector
                parameters["inputPoint1"] = point1.CIVector
                parameters["inputRadius"] = radius
                parameters["inputRefraction"] = refraction
                super.init(filterName: "CIGlassLozenge", parameters: parameters)
            }
        }
        
        /**
         CIHoleDistortion
         Creates a circular area that pushes the image pixels outward, distorting those pixels closest to the circle the most.
         */
        @available(iOS 6.0, OSX 10.4, *)
        public final class HoleDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                super.init(filterName: "CIHoleDistortion", parameters: parameters)
            }
        }
        
        /**
         CILightTunnel
         Rotates a portion of the input image specified by the center and radius parameters to give a tunneling effect.
         */
        @available(iOS 6.0, OSX 10.11, *)
        public final class LightTunnel: FilterComponent {
            
            public required init(center: Vector2, rotation: Double, radius: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRotation"] = rotation
                parameters["inputRadius"] = radius
                super.init(filterName: "CILightTunnel", parameters: parameters)
            }
        }
        
        /**
         CIPinchDistortion
         Creates a rectangular area that pinches source pixels inward, distorting those pixels closest to the rectangle the most.
         */
        @available(iOS 6.0, OSX 10.4, *)
        public final class PinchDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double, scale: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputScale"] = scale
                super.init(filterName: "CIPinchDistortion", parameters: parameters)
            }
        }
        
        /**
         CIStretchCrop
         Distorts an image by stretching and or cropping it to fit a target size.
         */
        @available(iOS 9.0, OSX 10.6, *)
        public final class CIStretchCrop: FilterComponent {
            
            public required init(size: Vector2, cropAmount: Double, centerStrechAmount: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputSize"] = size.CIVector
                parameters["inputCropAmount"] = cropAmount
                parameters["inputCenterStrechAmount"] = centerStrechAmount
                super.init(filterName: "StretchCrop", parameters: parameters)
            }
        }
        
        /**
         CITorusLensDistortion
         Creates a torus-shaped lens and distorts the portion of the image over which the lens is placed.
         */
        @available(iOS 9.0, OSX 10.4, *)
        public final class TorusLensDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double, width: Double, refraction: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputWidth"] = width
                parameters["inputRefraction"] = refraction
                super.init(filterName: "CITorusLensDistortion", parameters: parameters)
            }
        }
        
        /**
         CITwirlDistortion
         Rotates pixels around a point to give a twirling effect.
         */
        @available(iOS 6.0, OSX 10.4, *)
        public final class TwirlDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double, angle: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputAngle"] = angle
                super.init(filterName: "CITwirlDistortion", parameters: parameters)
            }
        }
        /**
         CIVortexDistortion
         Rotates pixels around a point to simulate a vortex.
         */
        @available(iOS 6.0, OSX 10.4, *)
        public final class VortexDistortion: FilterComponent {
            
            public required init(center: Vector2, radius: Double, angle: Double) {
                var parameters: [String : AnyObject] = [:]
                parameters["inputCenter"] = center.CIVector
                parameters["inputRadius"] = radius
                parameters["inputAngle"] = angle
                super.init(filterName: "CIVortexDistortion", parameters: parameters)
            }
        }
    }
}
