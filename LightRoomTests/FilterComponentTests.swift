//
//  FilterComponentTests.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/27/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import XCTest

@testable import LightRoom

class FilterComponentTests: XCTestCase {

    static let image1 = CIImage(image: UIImage(named: "sample.jpg", in: Bundle(for: FilterComponentTests.self), compatibleWith: nil)!)!
    static let image2 = CIImage(image: UIImage(named: "sample3.jpg", in: Bundle(for: FilterComponentTests.self), compatibleWith: nil)!)!
    
    static let color = CIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    let blendImage = LightRoom.Generator.ConstantColorGenerator(cropRect:FilterComponentTests.image1.extent, color: FilterComponentTests.color)
    let addition = LightRoom.CompositeOperation.AdditionCompositing()
    let overlay = LightRoom.CompositeOperation.OverlayBlendMode()
    let colorControl = LightRoom.ColorAdjustment.ColorControls(saturation: 0.5, brightness: 0, contrast: 1)
    let colorControl2 = LightRoom.ColorAdjustment.ColorControls(saturation: 0, brightness: 0, contrast: 1)
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func customOperator() -> CIImage? {
        
        FilterComponentTests.image1 >>> colorControl --* addition
                     blendImage >>> addition --* overlay
        FilterComponentTests.image2 >>> colorControl2 >>> overlay
        
        overlay.outputImage
        
        return overlay.outputImage
    }
    
    func methodChain() -> CIImage? {
        
        let a = try? FilterComponentTests.image2
            .effect(colorControl2)
            .compose(overlay) {
                try self.blendImage.compose(self.addition) {
                    try FilterComponentTests.image1.effect(self.colorControl)
                }
        }
        
        return a
    }

    func testCustomOperator() {
        
        XCTAssert(self.customOperator() != nil)
    }
    
    func testMethodChain() {
        
        XCTAssert(self.methodChain() != nil)
    }
    
    func testOperatorIsEqualMethodChain() {
        
        let image1 = self.customOperator()!
        let image2 = self.methodChain()!
        
        let context = CIContext()
        
        let uiimage1 = UIImagePNGRepresentation(UIImage(cgImage: context.createCGImage(image1, from: image1.extent)!))
        let uiimage2 = UIImagePNGRepresentation(UIImage(cgImage: context.createCGImage(image2, from: image2.extent)!))
        
        XCTAssert((uiimage1 == uiimage2!) == true)
    }

    func testPerformanceMethodChain() {
        // This is an example of a performance test case.
        let context = CIContext()

        self.measure {
            let image = self.methodChain()!
            _ = UIImage(cgImage: context.createCGImage(image, from: image.extent)!)
        }
    }
    
    func testPerformanceCustomOperator() {
        // This is an example of a performance test case.
        let context = CIContext()
        
        self.measure {
            let image = self.customOperator()!
            _ = UIImage(cgImage: context.createCGImage(image, from: image.extent)!)
        }
    }

}
