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

public class FilterComponent: FilterComponentType {
    
    public let filterFactory: CIFilterFactory
    
    public var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    public let filterName: String
    public let parameters: [String: AnyObject]
    
    public var inputImage: CIImage? {
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
    
    private var cachedCIFilter: CIFilter?
}

public class GeneratorComponent {
    
    public let filterFactory: CIFilterFactory
    
    public var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    public var outputImage: CIImage? {
        return self.filter.outputImage?.cropping(to: self.cropRect)
    }
    
    public let filterName: String
    public let parameters: [String: AnyObject]
    public var cropRect: CGRect = .zero
    
    public init(filterName: String, cropRect: CGRect, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
        self.cropRect = cropRect
        
        self.filterFactory = {
            return CIFilter(name: filterName, withInputParameters: parameters)!
        }
    }
    
    public func crop(_ rect: CGRect) throws -> CIImage {
        guard let image = self.filter.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image.cropping(to: rect)
    }
    
    public func effect(_ chain: FilterChain) throws -> CIImage {
        
        chain.inputImage = self.outputImage
        
        guard let image = chain.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    public func effect(_ component: FilterComponentType) throws -> CIImage {
        
        component.inputImage = self.outputImage
        
        guard let image = component.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    public func compose(_ component: CompositionFilterComponent, _ backgroundImageBlock: () throws -> CIImage?) throws -> CIImage {
        
        return try self.compose(component, backgroundImageBlock())
    }
    
    public func compose(_ component: CompositionFilterComponent, _ backgroundImage: CIImage?) throws -> CIImage {
        
        component.inputImage = self.outputImage
        component.inputBackgroundImage = backgroundImage
        
        guard let image = component.outputImage else {
            throw LightRoomError.invalidOutputImage
        }
        
        return image
    }
    
    private var cachedCIFilter: CIFilter?
}

public class CompositionFilterComponent: FilterComponentType {
    
    public let filterFactory: CIFilterFactory
    
    public var filter: CIFilter {
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
    
    public var inputImage: CIImage? {
        get {
            return self.filter.value(forKey: kCIInputImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputImageKey)
        }
    }
    
    public var inputBackgroundImage: CIImage? {
        get {
            return self.filter.value(forKey: kCIInputBackgroundImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputBackgroundImageKey)
        }
    }
    
    private var cachedCIFilter: CIFilter?
}

