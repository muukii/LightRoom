//
//  FilterComponent.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

public typealias CIFilterFactory = () -> CIFilter

public protocol FilterComponentType: class {

    var filter: CIFilter { get }
    var outputImage: CIImage? { get }
    var inputImage: CIImage? { get }
}

extension FilterComponentType {
    
    public var outputImage: CIImage? {
        return self.filter.outputImage
    }
    
    public var inputImage: CIImage? {
        get {
            return self.filter.valueForKey(kCIInputImageKey) as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: kCIInputImageKey)
        }
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
    
    public init(filterName: String, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
        self.filterFactory = {
            return CIFilter(name: filterName, withInputParameters: parameters)!
        }
    }
    
    private var cachedCIFilter: CIFilter?
}

public class CompositionFilterComponent: FilterComponentType {
    
    public let filterFactory: CIFilterFactory
    public var invertInput: Bool = false
    
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
            if self.invertInput {
                return self.filter.valueForKey(kCIInputBackgroundImageKey) as? CIImage
            } else {
                return self.filter.valueForKey(kCIInputImageKey) as? CIImage
            }
        }
        set {
            if self.invertInput {
                self.filter.setValue(newValue, forKey: kCIInputBackgroundImageKey)
            } else {
                self.filter.setValue(newValue, forKey: kCIInputImageKey)
            }
        }
    }
    
    public var backgroundImage: CIImage? {
        get {
            if self.invertInput {
                return self.filter.valueForKey(kCIInputImageKey) as? CIImage
            } else {
                return self.filter.valueForKey(kCIInputBackgroundImageKey) as? CIImage
            }
        }
        set {
            if self.invertInput {
                self.filter.setValue(newValue, forKey: kCIInputImageKey)
            } else {
                self.filter.setValue(newValue, forKey: kCIInputBackgroundImageKey)
            }
        }
    }
    
    private var cachedCIFilter: CIFilter?

}

