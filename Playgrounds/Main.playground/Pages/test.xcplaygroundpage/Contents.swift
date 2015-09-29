//: Playground - noun: a place where people can play

import UIKit
import LightRoom
import SwiftyJSON

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!


let matrix = LightRoom.ColorAdjustment.ColorMatrix(
    rVector: [1,0,0,0.1],
    gVector: [0,1,0,0],
    bVector: [0,0,1,0],
    aVector: [0,0,0,1],
    biasVector: [0,0,0,0])

let sharpen = LightRoom.Sharpen.SharpenLuminance(sharpness: 20)

(matrix.filter >>> sharpen.filter)(image)

//FilterGen.export(filterGens: [matrix, sharpen])
let json = try! ExportFilterGen(filterGens: [matrix,sharpen])
json.description
let filter = try! CreateFilterGen(json: json).map { $0.filter }

(filter[0] >>> filter[1])(image)


let toneCurve = LightRoom.CombinedFilter.RGBToneCurve(
    rPoints: [
        [0,0],
        [0.2,0.2],
        [0.5,0.5],
        [0.7,0.7],
        [1,1],
    ],
    gPoints: [
        [0,0],
        [0.2,0.2],
        [0.5,0.5],
        [0.7,0.7],
        [1,1],
    ], bPoints: [
        [0,0],
        [0.2,0.2],
        [0.5,0.5],
        [0.7,0.7],
        [1,1],
    ], rgbPoints: [
        [0,0.5],
        [0.2,0.2],
        [0.5,0.5],
        [0.7,0.7],
        [1,1],
    ])

toneCurve.json.description

let json100 = try? ExportFilterGen(filterGens: [toneCurve])

let filters = try! CreateFilterGen(json: json100!)

filters.first?.filter(image)


