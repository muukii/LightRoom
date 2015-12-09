//
//  GeometryAdjustment.swift
//  LightRoom
//
//  Created by Muukii on 10/20/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    
    public enum GeometryAdjustment {
        
        /**
         CILanczosScaleTransform
         Produces a high-quality, scaled version of a source image.
         */
        public static func Crop(rect rect: Vector4) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                    "inputRectangle": rect.CIVector,
                ]
                
                let filter = CIFilter(name: "CICrop", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
        
        /**
        CILanczosScaleTransform
        Produces a high-quality, scaled version of a source image.
        */
        public static func lanczosScaleTransform(scale scale: Double, aspectRatio: Double) -> Filter {
            
            return { image in
                
                let parameters = [
                    kCIInputImageKey: image,
                    "inputScale": scale,
                    "inputAspectRatio" : aspectRatio,
                ]
                
                let filter = CIFilter(name: "CILanczosScaleTransform", withInputParameters: parameters)
                return filter!.outputImage!
            }
        }
    }
}