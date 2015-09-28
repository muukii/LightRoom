//
//  FilterGen.swift
//  LightRoom
//
//  Created by Muukii on 9/28/15.
//  Copyright © 2015 muukii. All rights reserved.
//

import Foundation
import SwiftyJSON

public enum FilterJSONConvertErrorType: ErrorType {
    
    case MissingRequiredParameter(requiredParameterName: String)
    case CanNotConvertJSON(filterGen: FilterGen)
}

public protocol FilterJSONConvertible {
    
    var json: JSON { get }
}

public protocol FilterGen {
    
    var filterName: String { get }
    var filter: Filter { get }
}

public func CreateFilterGen(json json: JSON) throws -> [FilterGen] {
    
    var filterGens: [FilterGen] = []
    
    for json in json["filters"].arrayValue {
        
        guard let filterName = json[LightRoomJSONKeys.FilterName].string else {
            throw FilterJSONConvertErrorType.MissingRequiredParameter(requiredParameterName: LightRoomJSONKeys.FilterName)
        }
        
        if filterName.hasPrefix("CI") {
            
            let gen = try CIFilterGen(json: json)
            filterGens.append(gen)
        } else {
            
            switch filterName {
            case "RGBToneCurve":
                break
            default:
                break
            }
        }
    }
    
    return filterGens
}

public func ExportFilterGen(filterGens filterGens: [FilterGen]) throws -> JSON {
    
    var jsons: [JSON] = []
    
    for filterGen in filterGens {
        
        guard let _filterGen = filterGen as? FilterJSONConvertible else {
            throw FilterJSONConvertErrorType.CanNotConvertJSON(filterGen: filterGen)
        }
        
        jsons.append(_filterGen.json)
    }
    
    let json = JSON(["filters" : JSON(jsons)])
    
    return json
}


//public extension FilterGen {
//
//    static func create(json json: JSON) throws -> [FilterGen] {
//        
//        var filterGens: [FilterGen] = []
//        
//        for json in json["filters"].arrayValue {
//            
//            guard let filterName = json[LightRoomJSONKeys.FilterName].string else {
//                throw FilterJSONConvertErrorType.MissingRequiredParameter(requiredParameterName: LightRoomJSONKeys.FilterName)
//            }
//            
//            if filterName.hasPrefix("CI") {
//                
//                let gen = try CIFilterGen(json: json)
//                filterGens.append(gen)
//            } else {
//                
//                switch filterName {
//                case "RGBToneCurve":
//                    break
//                default:
//                    break
//                }
//            }
//        }
//        
//        return filterGens
//    }
//    
//    static func export(filterGens filterGens: [FilterGen]) throws -> JSON {
//        
//        var jsons: [JSON] = []
//        
//        for filterGen in filterGens {
//            
//            guard let _filterGen = filterGen as? FilterJSONConvertible else {
//                throw FilterJSONConvertErrorType.CanNotConvertJSON(filterGen: filterGen)
//            }
//            
//            jsons.append(_filterGen.json)
//        }
//        
//        let json = JSON(["filters" : JSON(jsons)])
//        
//        return json
//    }
//}

    public struct LightRoomJSONKeys {
        static let FilterName = "filterName"
        static let Parameters = "Parameters"
    }
    
    public class CIFilterGen: FilterGen {
        
        public convenience init(json: JSON) throws {
            
            guard let filterName = json[LightRoomJSONKeys.FilterName].string else {
                throw FilterJSONConvertErrorType.MissingRequiredParameter(requiredParameterName: LightRoomJSONKeys.FilterName)
            }
            
            guard let parameters = json[LightRoomJSONKeys.Parameters].dictionaryObject else {
                throw FilterJSONConvertErrorType.MissingRequiredParameter(requiredParameterName: LightRoomJSONKeys.Parameters)
            }
            
            var objectParameters: [String: AnyObject] = [ : ]
            
            for param in parameters {
                
                guard let string = param.1 as? String else {
                    
                    fatalError("")
                }
                
                if let value = Double(string) {
                    
                    objectParameters[param.0] = value
                } else if string.hasPrefix("[") && string.hasSuffix("]") {
                    
                    let value = CIVector(string: string)
                    objectParameters[param.0] = value
                } else {
                    
                    let value = CIColor(string: string)
                    objectParameters[param.0] = value
                }
            }
            
            self.init(filterName: filterName, parameters: objectParameters)
        }
        
        public let filterName: String
        public let parameters: [String: AnyObject]
        
        init(filterName: String, parameters: [String: AnyObject]) {
            
            self.filterName = filterName
            self.parameters = parameters
        }
        
        public var filter: Filter {
            
            return LightRoom.createFilter(name: filterName, parameters: parameters)
        }
    }

public extension FilterJSONConvertible where Self: CIFilterGen {
    
    public var json: JSON {
        
        var rawJSON: [String: AnyObject] = [ : ]
        
        rawJSON[LightRoomJSONKeys.FilterName] = self.filterName
        
        var parametersJSON: [String: String] = [ : ]
        for param in self.parameters {
            
            let string: String
            switch param.1 {
            case let value as CIColor:
                string = value.stringRepresentation
            case let value as CIVector:
                string = value.stringRepresentation
            case let value as Double:
                string = String(value)
            case let value as Float:
                string = String(value)
            case let value as CGFloat:
                string = String(value)
            default:
                fatalError("Catched Not Supproted Value")
            }
            
            parametersJSON[param.0] = string
        }
        
        rawJSON[LightRoomJSONKeys.Parameters] = parametersJSON
        
        return JSON(rawJSON)
    }
}