//
//  CIImage+LightRoom.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/27/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation
import CoreImage

extension CIImage {
    
    public func effect(chain: FilterChain) throws -> CIImage {
        
        chain.inputImage = self
        
        guard let image = chain.outputImage else {
            throw LightRoomError.InvalidOutputImage
        }
        
        return image
    }
    
    public func effect(component: FilterComponentType) throws -> CIImage {
        
        component.inputImage = self
        
        guard let image = component.outputImage else {
            throw LightRoomError.InvalidOutputImage
        }
        
        return image
    }
    
    public func compose(component: CompositionFilterComponent, _ backgroundImageBlock: () throws -> CIImage?) throws -> CIImage {
        
        return try self.compose(component, backgroundImageBlock())
    }
    
    public func compose(component: CompositionFilterComponent, _ backgroundImage: CIImage?) throws -> CIImage {
        
        component.inputImage = self
        component.inputBackgroundImage = backgroundImage
        
        guard let image = component.outputImage else {
            throw LightRoomError.InvalidOutputImage
        }
        
        return image
    }
}
