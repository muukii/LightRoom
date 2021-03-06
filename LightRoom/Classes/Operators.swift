//
//  Operators.swift
//  LightRoom
//
//  Created by Hiroshi Kimura on 2/27/16.
//  Copyright © 2016 muukii. All rights reserved.
//

import Foundation
import CoreImage

/**
Connect FilterComponentType to FilterComponentType
*/
infix operator >>> : MultiplicationPrecedence
/**
Set inputBackgroundImage on CompositionComponentType
*/
infix operator --* : MultiplicationPrecedence

@discardableResult
public func >>> (chain1: FilterChain, chain2: FilterChain) -> FilterChain {
    chain2.inputImage = chain1.outputImage
    _ = chain1.connect(chain2)
    return chain2
}

@discardableResult
public func >>> (image: CIImage?, chain: FilterChain) -> FilterChain {
    chain.inputImage = image
    return chain
}

@discardableResult
public func >>> (image: CIImage?, component: FilterComponentType) -> FilterComponentType {
    component.inputImage = image
    return component
}

@discardableResult
public func >>> (chain1: FilterComponentType, component: FilterComponentType) -> FilterComponentType {
    component.inputImage = chain1.outputImage
    return component
}

@discardableResult
public func >>> (gen: GeneratorComponent, component: FilterComponentType) -> FilterComponentType {
    component.inputImage = gen.outputImage
    return component
}

@discardableResult
public func --* (chain1: FilterComponentType, component: CompositionFilterComponent) -> FilterComponentType {
    component.inputBackgroundImage = chain1.outputImage
    return component
}

@discardableResult
public func --* (image: CIImage?, component: CompositionFilterComponent) -> FilterComponentType {
    component.inputBackgroundImage = image
    return component
}

@discardableResult
public func --* (gen: GeneratorComponent, component: CompositionFilterComponent) -> FilterComponentType {
    component.inputBackgroundImage = gen.outputImage
    return component
}
