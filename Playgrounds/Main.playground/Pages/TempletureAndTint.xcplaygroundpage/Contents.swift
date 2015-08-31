//: [Previous](@previous)

import Foundation
import LightRoom

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [6500,0],
    targetNeutral: [3500,0])(image)


LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [3400,0],
    targetNeutral: [3400,0])(image)
LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [6500,0],
    targetNeutral: [2500,0])(image)
LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [6500,0],
    targetNeutral: [3500,0])(image)
LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [6500,0],
    targetNeutral: [3500,0])(image)
LightRoom.ColorAdjustment.temperatureAndTint(
    neutral: [6500,0],
    targetNeutral: [3500,0])(image)



