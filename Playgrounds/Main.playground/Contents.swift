//: Playground - noun: a place where people can play

import UIKit
import LightRoom

kCIInputSharpnessKey
let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!))!

let result = Filters.Blur.motionBlur(radius: 20, angle: 0.2)(image)
