//
//  FilterChain.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

public class FilterChain {
    
    public private(set) var filterComponents: [FilterComponent] = [] {
        didSet {
            self.connectFilters()
        }
    }
    
    public func addFilterComponent(filterComponent: FilterComponent) {
        self.filterComponents.append(filterComponent)
    }
    
    public var inputImage: CIImage? {
        didSet {
            
            self.connectFilters()
        }
    }
    
    public var outputImage: CIImage? {
        return self.filterComponents.last?.outputImage
    }
    
    public required init() {
        
    }
    
    private func connectFilters() {
        
        self.filterComponents.first?.inputImage = self.inputImage
        
        var outputImage: CIImage?
        for components in self.filterComponents {
            if let outputImage = outputImage {
                components.inputImage = outputImage
            }
            outputImage = components.outputImage
        }
    }
}