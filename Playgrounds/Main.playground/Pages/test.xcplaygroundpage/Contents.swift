//: Playground - noun: a place where people can play

import UIKit
import LightRoom
import SwiftyJSON

let image = CIImage(data: NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("sample1", ofType: "jpg")!)!)!

LightRoom.Stylize.HighlightShadowAdjust(highlightAmount: 2, shadowAmount: 0).filter(image)
LightRoom.ColorAdjustment.GammmaAdjust(power: 0.7).filter(image)


let amount: Double = 0.8
(
    LightRoom.Stylize.HighlightShadowAdjust(highlightAmount: 1, shadowAmount: -amount * 0.2).filter >>>
        LightRoom.Sharpen.UnsharpMask(radius: 3 * amount, intencity: 1).filter
)(image)









