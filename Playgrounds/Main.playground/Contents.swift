//: Playground - noun: a place where people can play

import UIKit
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!))!

let result = Filters.blur(40)(image)
