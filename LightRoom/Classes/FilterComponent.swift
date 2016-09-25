//
//  FilterComponent.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation
import CoreImage

public typealias CIFilterFactory = () -> CIFilter

public protocol FilterComponentType: class {

    var filter: CIFilter { get }
    var inputImage: CIImage? { get set }
    var outputImage: CIImage? { get }
}

extension FilterComponentType {
    
    public var outputImage: CIImage? {
        return self.filter.outputImage
    }
}

open class FilterComponent: FilterComponentType {
    
    open let filterFactory: CIFilterFactory
    
    open var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    open let filterName: String
    open let parameters: [String: AnyObject]
    
    open var inputImage: CIImage? {
        get {
            return self.filter.value(forKey: kCIInputImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputImageKey)
        }
    }
    
    public init(filterName: String, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
        self.filterFactory = {
            return CIFilter(name: filterName, withInputParameters: parameters)!
        }
    }
    
    fileprivate var cachedCIFilter: CIFilter?
}

open class GeneratorComponent {
    
    open let filterFactory: CIFilterFactory
    
    open var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    open var outputImage: CIImage? {
        return self.filter.outputImage?.cropping(to: self.cropRect)
    }
    
    open let filterName: String
    open let parameters: [String: AnyObject]
    open var cropRect: CGRect = .zero
    
    public init(filterName: String, cropRect: CGRect, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
        self.cropRect = cropRect
        
        self.filterFactory = {
            return CIFilter(name: filterName, withInputParameters: parameters)!
        }
    }
    
    open func crop(_ rect: CGRect) throws -> CIImage {
        guard let image = self.filter.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image.cropping(to: rect)
    }
    
    open func effect(_ chain: FilterChain) throws -> CIImage {
        
        chain.inputImage = self.outputImage
        
        guard let image = chain.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    open func effect(_ component: FilterComponentType) throws -> CIImage {
        
        component.inputImage = self.outputImage
        
        guard let image = component.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    open func compose(_ component: CompositionFilterComponent, _ backgroundImageBlock: () throws -> CIImage?) throws -> CIImage {
        
        return try self.compose(component, backgroundImageBlock())
    }
    
    open func compose(_ component: CompositionFilterComponent, _ backgroundImage: CIImage?) throws -> CIImage {
        
        component.inputImage = self.outputImage
        component.inputBackgroundImage = backgroundImage
        
        guard let image = component.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    fileprivate var cachedCIFilter: CIFilter?
}

open class CompositionFilterComponent: FilterComponentType {
    
    open let filterFactory: CIFilterFactory
    
    open var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    public init(filterName: String) {
        self.filterFactory = {
            return CIFilter(name: filterName)!
        }
    }
    
    open var inputImage: CIImage? {
        get {
            return self.filter.value(forKey: kCIInputImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputImageKey)
        }
    }
    
    open var inputBackgroundImage: CIImage? {
        get {
            return self.filter.value(forKey: kCIInputBackgroundImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputBackgroundImageKey)
        }
    }
    
    fileprivate var cachedCIFilter: CIFilter?
}

