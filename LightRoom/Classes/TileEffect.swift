//
//  TileEffect.swift
//  LightRoom
//
//  Created by muukii on 4/16/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    /**
     CICategoryTileEffect
     */
    public enum TileEffect {
        
        /**
         CIAffineClamp
         
         Performs an affine transform on a source image and then clamps the pixels at the edge of the transformed image, extending them outwards.
         */
        @available(iOS 6.0, OSX 10.4, *)
        public final class AffineClamp: FilterComponent {
            
            public required init(transform: CGAffineTransform?) {
                var parameters: [String:AnyObject] = [:]
                parameters["inputTransform"] = transform.map{ NSValue(CGAffineTransform: $0) }
                super.init(filterName: "CIAffineClamp", parameters: parameters)
            }
        }
    }
}