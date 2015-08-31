//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

LightRoom.Sharpen.sharpenLuminance(sharpness: 0)(image)
LightRoom.Sharpen.sharpenLuminance(sharpness: 0.2)(image)
LightRoom.Sharpen.sharpenLuminance(sharpness: 0.4)(image)
LightRoom.Sharpen.sharpenLuminance(sharpness: 0.8)(image)
LightRoom.Sharpen.sharpenLuminance(sharpness: 1)(image)




