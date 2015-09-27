//: Playground - noun: a place where people can play

import UIKit
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

LightRoom.Blur.BoxBlur(radius: 3)

//let colorMatrixFilter = LightRoom.ColorAdjustment.exposureAdjust(ev: 0.1)
//let motionBlurFilter = LightRoom.Blur.motionBlur(radius: 10, angle: 0.2)
//
//let combinedFilter = colorMatrixFilter >>> motionBlurFilter
//
//let outputImage = combinedFilter(image)
