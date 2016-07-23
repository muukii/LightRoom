//
//  FilterChain.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation
import CoreImage

public class FilterChain {
    
    public let factory: (CIImage?) -> CIImage?
    
    public init(_ factory: (CIImage?) -> CIImage?) {
        self.factory = factory
    }
    
    public var inputImage: CIImage? {
        didSet {
            self.outputImage = self.factory(self.inputImage)
        }
    }
    
    public var outputImage: CIImage? {
        didSet {
            
        }
    }
    
    public func connect(_ chain: FilterChain) -> FilterChain {
        chain.inputImage = self.outputImage
        return self
    }
    
    public func output() -> CIImage? {
        return self.outputImage
    }
}

