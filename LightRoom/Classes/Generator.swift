//
//  Generator.swift
//  LightRoom
//
//  Created by Muukii on 10/4/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {

    /**
    CICategoryGenerator
     */
    public enum Generator {
        
        /**
        CIConstantColorGenerator
         
        Generates a solid color.
         */
        @available(iOS 5.0, OSX 10.4, *)
        public final class ConstantColorGenerator: GeneratorComponent {
            public required init(cropRect: CGRect, color: CIColor) {
                super.init(
                    filterName: "CIConstantColorGenerator",
                    cropRect: cropRect,
                    parameters: [
                        kCIInputColorKey: color
                    ]
                )
            }
        }
        
        @available(iOS 6.0, OSX 10.4, *)
        public final class RandomGenerator: GeneratorComponent {
            public required init(cropRect: CGRect) {
                super.init(
                    filterName: "CIRandomGenerator",
                    cropRect: cropRect,
                    parameters: [
                        :
                    ]
                )
            }
        }
        
    }
}