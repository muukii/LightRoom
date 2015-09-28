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
let json = try! ExportFilterGen(filterGens: [sharpen,matrix])
json.description
let filter = try! CreateFilterGen(json: json).map { $0.filter }

(filter[0] >>> filter[1])(image)

//try! LightRoom.CIFilterGen.filterGen(json: json).filter(image)

//let colorMatrixFilter = LightRoom.ColorAdjustment.exposureAdjust(ev: 0.1)
//let motionBlurFilter = LightRoom.Blur.motionBlur(radius: 10, angle: 0.2)
//
//let combinedFilter = colorMatrixFilter >>> motionBlurFilter
//
//let outputImage = combinedFilter(image)

CIVector(CGPoint: CGPoint(x: 0, y: 0))

CIVector(string: "[0 0]")
CIVector(string: "0 1")

Double("[3]")

let string = CIColor(red: 0.2, green: 0, blue: 0, alpha: 0).stringRepresentation

CIVector(string: string)
