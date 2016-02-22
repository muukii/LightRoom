//
//  FilterChain.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

infix operator ~~> { associativity left }
public func ~~> (chain1: FilterChain, chain2: FilterChain) -> FilterChain {
    let components = chain1.filterComponents + chain2.filterComponents
    return FilterChain(filterComponents: components)
}


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
        guard self.inputImage != nil else {
            return nil
        }
        return self.filterComponents.last?.outputImage
    }
    
    public init() {
        
    }
    
    public init(filterComponent: FilterComponent) {
        self.filterComponents = [filterComponent]
    }
    
    public init(filterComponents: [FilterComponent]) {
        self.filterComponents = filterComponents
    }
    
    private func connectFilters() {
        
        guard let inputImage = self.inputImage else { return }
        
        self.filterComponents.first?.inputImage = inputImage
        
        var outputImage: CIImage?
        for components in self.filterComponents {
            if let outputImage = outputImage {
                components.inputImage = outputImage
            }
            outputImage = components.outputImage
        }
    }
}