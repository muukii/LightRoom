//
//  FilterComponent.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/22/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

public class FilterComponent {
    
    public typealias FilterFactory = () -> CIFilter
    
    public let filterFactory: FilterFactory
    
    public init(filterFactory: FilterFactory) {
        self.filterFactory = filterFactory
    }
    
    public var filter: CIFilter {
        if let cachedCIFilter = self.cachedCIFilter {
            return cachedCIFilter
        }
        let filter = self.filterFactory()
        self.cachedCIFilter = filter
        return filter
    }
    
    internal var inputImage: CIImage? {
        get {
            return self.filter.valueForKey("inputImage") as? CIImage
        }
        set {
            self.filter.setValue(newValue, forKey: "inputImage")
        }
    }
    
    internal var outputImage: CIImage? {
        return self.filter.outputImage
    }
    
    private var cachedCIFilter: CIFilter?
}

public class CIFilterComponent: FilterComponent {

    public let filterName: String
    public let parameters: [String: AnyObject]
    
    public init(filterName: String, parameters: [String: AnyObject]) {
        
        self.filterName = filterName
        self.parameters = parameters
        
        super.init { () -> CIFilter in
            
            return CIFilter(name: filterName, withInputParameters: parameters)!
        }
    }
}