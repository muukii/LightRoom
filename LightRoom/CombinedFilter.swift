//
//  CombinedFilter.swift
//  LightRoom
//
//  Created by Muukii on 9/29/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import SwiftyJSON

public extension LightRoom {
    
    public struct CombinedFilter {
        
        public class Fade: FilterGen, FilterJSONConvertible {
            
            public var filterName: String {
                return "Fade"
            }
            
            let alpha: Double
            
            public required init(alpha: Double) {
                
                self.alpha = alpha
            }
            
            public required init(json: JSON) throws {
                
                guard let _parameters = json[LightRoomJSONKeys.Parameters].dictionaryObject else {
                    
                    fatalError("")
                }
                
                let parameters = StringParametersToCIFilterParameters(_parameters)
                
                self.alpha = parameters["alpha"] as! Double
                
                guard json[LightRoomJSONKeys.FilterName].string == self.filterName else {
                    throw FilterJSONConvertErrorType.CanNotConvertJSON(filterGen: self)
                }
            }
            
            public var filter: Filter {
                
                return { image in
                    
                    let color = CIColor(red: 1, green: 1, blue: 1, alpha: CGFloat(self.alpha))
                    
                    let fadeImage = LightRoom.Generator.constantColorGenerator(color: color)().imageByCroppingToRect(image.extent)
                    
                    return LightRoom.CompositeOperation.sourceAtopCompositing()(image: fadeImage, backgroundImage: image)
                }
            }
            
            public var json: JSON {
                
                var rawJSON: [String: AnyObject] = [ : ]
                
                var parameters: [String: AnyObject] = [ : ]
                parameters["alpha"] = self.alpha
                    
                rawJSON[LightRoomJSONKeys.FilterName] = self.filterName
                rawJSON[LightRoomJSONKeys.Parameters] = CIFilterParametersToStringParameters(parameters)
                
                return JSON(rawJSON) 
            }
        }
        
        public class RGBToneCurve: FilterGen, FilterJSONConvertible {
            
            public var filterName: String {
                return "RGBToneCurve"
            }
            
            let rPoints: [Vector2]
            let gPoints: [Vector2]
            let bPoints: [Vector2]
            let rgbPoints: [Vector2]
            
            public required init(rPoints: [Vector2],
                gPoints: [Vector2],
                bPoints: [Vector2],
                rgbPoints: [Vector2]) {
                    
                    self.rPoints = rPoints
                    self.gPoints = gPoints
                    self.bPoints = bPoints
                    self.rgbPoints = rgbPoints
            }
            
            public required init(json: JSON) throws {
                
                guard let _parameters = json[LightRoomJSONKeys.Parameters].dictionaryObject else {
                    
                    fatalError("")
                }
                
                let parameters = StringParametersToCIFilterParameters(_parameters)
                
                self.rPoints = [
                    parameters[JSONKeys.RPoint0] as! CIVector,
                    parameters[JSONKeys.RPoint1] as! CIVector,
                    parameters[JSONKeys.RPoint2] as! CIVector,
                    parameters[JSONKeys.RPoint3] as! CIVector,
                    parameters[JSONKeys.RPoint4] as! CIVector,
                    ].map { [$0.valueAtIndex(0), $0.valueAtIndex(1)] }
                
                self.gPoints = [
                    parameters[JSONKeys.GPoint0] as! CIVector,
                    parameters[JSONKeys.GPoint1] as! CIVector,
                    parameters[JSONKeys.GPoint2] as! CIVector,
                    parameters[JSONKeys.GPoint3] as! CIVector,
                    parameters[JSONKeys.GPoint4] as! CIVector,
                    ].map { [$0.valueAtIndex(0), $0.valueAtIndex(1)] }
                
                self.bPoints = [
                    parameters[JSONKeys.BPoint0] as! CIVector,
                    parameters[JSONKeys.BPoint1] as! CIVector,
                    parameters[JSONKeys.BPoint2] as! CIVector,
                    parameters[JSONKeys.BPoint3] as! CIVector,
                    parameters[JSONKeys.BPoint4] as! CIVector,
                    ].map { [$0.valueAtIndex(0), $0.valueAtIndex(1)] }
                
                self.rgbPoints = [
                    parameters[JSONKeys.RGBPoint0] as! CIVector,
                    parameters[JSONKeys.RGBPoint1] as! CIVector,
                    parameters[JSONKeys.RGBPoint2] as! CIVector,
                    parameters[JSONKeys.RGBPoint3] as! CIVector,
                    parameters[JSONKeys.RGBPoint4] as! CIVector,
                    ].map { [$0.valueAtIndex(0), $0.valueAtIndex(1)] }
                
                guard json[LightRoomJSONKeys.FilterName].string == self.filterName else {
                    throw FilterJSONConvertErrorType.CanNotConvertJSON(filterGen: self)
                }
            }
            
            public var filter: Filter {
                
                return { image in
                    
                    let rImage = LightRoom.ColorAdjustment.ToneCurve(
                        point0: self.rPoints[0],
                        point1: self.rPoints[1],
                        point2: self.rPoints[2],
                        point3: self.rPoints[3],
                        point4: self.rPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                            rVector: [1,0,0,0],
                            gVector: [0,0,0,0],
                            bVector: [0,0,0,0],
                            aVector: [0,0,0,1],
                            biasVector: [0,0,0,0]).filter(image))
                    
                    let gImage = LightRoom.ColorAdjustment.ToneCurve(
                        point0: self.gPoints[0],
                        point1: self.gPoints[1],
                        point2: self.gPoints[2],
                        point3: self.gPoints[3],
                        point4: self.gPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                            rVector: [0,0,0,0],
                            gVector: [0,1,0,0],
                            bVector: [0,0,0,0],
                            aVector: [0,0,0,1],
                            biasVector: [0,0,0,0]).filter(image))
                    
                    let bImage = LightRoom.ColorAdjustment.ToneCurve(
                        point0: self.bPoints[0],
                        point1: self.bPoints[1],
                        point2: self.bPoints[2],
                        point3: self.bPoints[3],
                        point4: self.bPoints[4]).filter(LightRoom.ColorAdjustment.ColorMatrix(
                            rVector: [0,0,0,0],
                            gVector: [0,0,0,0],
                            bVector: [0,0,1,0],
                            aVector: [0,0,0,1],
                            biasVector: [0,0,0,0]).filter(image))
                    
                    let screenBlend = LightRoom.CompositeOperation.lightenBlendMode()
                    
                    let blendImage = screenBlend(
                        image: screenBlend(image: rImage, backgroundImage: bImage),
                        backgroundImage: gImage)
                    
                    return LightRoom.ColorAdjustment.ToneCurve(
                        point0: self.rgbPoints[0],
                        point1: self.rgbPoints[1],
                        point2: self.rgbPoints[2],
                        point3: self.rgbPoints[3],
                        point4: self.rgbPoints[4]).filter(blendImage)
                }
            }
            
            public var json: JSON {
                
                var rawJSON: [String: AnyObject] = [ : ]
                
                var parameters: [String: AnyObject] = [ : ]
                parameters[JSONKeys.RPoint0] = self.rPoints[0].CIVector
                parameters[JSONKeys.RPoint1] = self.rPoints[1].CIVector
                parameters[JSONKeys.RPoint2] = self.rPoints[2].CIVector
                parameters[JSONKeys.RPoint3] = self.rPoints[3].CIVector
                parameters[JSONKeys.RPoint4] = self.rPoints[4].CIVector
                
                parameters[JSONKeys.GPoint0] = self.gPoints[0].CIVector
                parameters[JSONKeys.GPoint1] = self.gPoints[1].CIVector
                parameters[JSONKeys.GPoint2] = self.gPoints[2].CIVector
                parameters[JSONKeys.GPoint3] = self.gPoints[3].CIVector
                parameters[JSONKeys.GPoint4] = self.gPoints[4].CIVector
                
                parameters[JSONKeys.BPoint0] = self.bPoints[0].CIVector
                parameters[JSONKeys.BPoint1] = self.bPoints[1].CIVector
                parameters[JSONKeys.BPoint2] = self.bPoints[2].CIVector
                parameters[JSONKeys.BPoint3] = self.bPoints[3].CIVector
                parameters[JSONKeys.BPoint4] = self.bPoints[4].CIVector
                
                parameters[JSONKeys.RGBPoint0] = self.rgbPoints[0].CIVector
                parameters[JSONKeys.RGBPoint1] = self.rgbPoints[1].CIVector
                parameters[JSONKeys.RGBPoint2] = self.rgbPoints[2].CIVector
                parameters[JSONKeys.RGBPoint3] = self.rgbPoints[3].CIVector
                parameters[JSONKeys.RGBPoint4] = self.rgbPoints[4].CIVector
                
                rawJSON[LightRoomJSONKeys.FilterName] = self.filterName
                rawJSON[LightRoomJSONKeys.Parameters] = CIFilterParametersToStringParameters(parameters)
                
                return JSON(rawJSON)                
            }
            
            private struct JSONKeys {
            
                static var RPoint0 = "rPoint0"
                static var RPoint1 = "rPoint1"
                static var RPoint2 = "rPoint2"
                static var RPoint3 = "rPoint3"
                static var RPoint4 = "rPoint4"
                
                static var GPoint0 = "gPoint0"
                static var GPoint1 = "gPoint1"
                static var GPoint2 = "gPoint2"
                static var GPoint3 = "gPoint3"
                static var GPoint4 = "gPoint4"
                
                static var BPoint0 = "bPoint0"
                static var BPoint1 = "bPoint1"
                static var BPoint2 = "bPoint2"
                static var BPoint3 = "bPoint3"
                static var BPoint4 = "bPoint4"
                
                static var RGBPoint0 = "rgbPoint0"
                static var RGBPoint1 = "rgbPoint1"
                static var RGBPoint2 = "rgbPoint2"
                static var RGBPoint3 = "rgbPoint3"
                static var RGBPoint4 = "rgbPoint4"
            }
        }
    }
}