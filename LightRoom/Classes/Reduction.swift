//
//  Reduction.swift
//  LightRoom
//
//  Created by muukii on 7/23/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation

public extension LightRoom {
    
    public enum Reduction {
        
        /**
         CIAreaAverage
         
         Returns a single-pixel image that contains the average color for the region of interest.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class AreaAverage: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIAreaAverage", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIAreaHistogram
         
         Returns a 1D image (inputCount wide by one pixel high) that contains the component-wise histogram computed for the specified rectangular area.
         */
        @available(iOS 8.0, OSX 10.5, *)
        public final class AreaHistogram: FilterComponent {
            
            public required init(
                extent: Vector4,
                count: Int,
                scale: Double) {
                
                super.init(filterName: "CIAreaHistogram", parameters: [
                    "inputExtent": extent.CIVector,
                    "inputCount": count as AnyObject,
                    "inputScale": scale as AnyObject,
                    ]
                )
            }
        }
        
        /**
         CIRowAverage
         
         Returns a 1-pixel high image that contains the average color for each scan row.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class RowAverage: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIRowAverage", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIColumnAverage
         
         Returns a 1-pixel high image that contains the average color for each scan row.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class ColumnAverage: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIColumnAverage", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIHistogramDisplayFilter
         
         Returns a 1D image (inputCount wide by one pixel high) that contains the component-wise histogram computed for the specified rectangular area.
         */
        @available(iOS 8.0, OSX 10.9, *)
        public final class HistogramDisplayFilter: FilterComponent {
            
            public required init(
                height: Double,
                highLimit: Double,
                lowLimit: Double) {
                
                super.init(filterName: "CIHistogramDisplayFilter", parameters: [
                    "inputHeight": height as AnyObject,
                    "inputHighLimit": highLimit as AnyObject,
                    "inputLowLimit": lowLimit as AnyObject,
                    ]
                )
            }
        }
        
        /**
         CIAreaMaximum
         
         Returns a single-pixel image that contains the maximum color components for the region of interest.
         
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class AreaMaximum: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIAreaMaximum", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIAreaMinimum
         
         Returns a single-pixel image that contains the minimum color components for the region of interest.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class AreaMinimum: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIAreaMinimum", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIAreaMaximumAlpha
         
         Returns a single-pixel image that contains the color vector with the maximum alpha value for the region of interest.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class AreaMaximumAlpha: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIAreaMaximumAlpha", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
        
        /**
         CIAreaMinimumAlpha
         
         Returns a single-pixel image that contains the color vector with the minimum alpha value for the region of interest.
         */
        @available(iOS 9.0, OSX 10.5, *)
        public final class AreaMinimumAlpha: FilterComponent {
            
            public required init(extent: Vector4) {
                
                super.init(filterName: "CIAreaMinimumAlpha", parameters: [
                    "inputExtent": extent.CIVector,
                    ]
                )
            }
        }
    }
}
