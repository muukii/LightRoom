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
        public final class Crop: CIFilterGen, FilterJSONConvertible {
            
            public required init(rect: Vector4) {
                
                super.init(filterName: "CICrop", parameters: [
                    "inputRectangle": rect.CIVector,
                    ]
                )
            }
        }
        
        /**
        CILanczosScaleTransform
        Produces a high-quality, scaled version of a source image.
        */      
        public final class LanczosScaleTransform: CIFilterGen, FilterJSONConvertible {
            
            public required init(scale: Double, aspectRatio: Double) {
                
                super.init(filterName: "CILanczosScaleTransform", parameters: [
                    "inputScale": scale,
                    "inputAspectRatio" : aspectRatio,
                    ]
                )
            }
        }
    }
}