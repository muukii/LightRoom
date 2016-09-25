//
//  FilterChain.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation
import CoreImage

open class FilterChain {
    
    open let factory: (CIImage?) -> CIImage?
    
    public init(_ factory: @escaping (CIImage?) -> CIImage?) {
        self.factory = factory
    }
    
    open var inputImage: CIImage? {
        didSet {
            self.outputImage = self.factory(self.inputImage)
        }
    }
    
    open var outputImage: CIImage? {
        didSet {
            
        }
    }
    
    open func connect(_ chain: FilterChain) -> FilterChain {
        chain.inputImage = self.outputImage
        return self
    }
    
    open func output() -> CIImage? {
        return self.outputImage
    }
}

