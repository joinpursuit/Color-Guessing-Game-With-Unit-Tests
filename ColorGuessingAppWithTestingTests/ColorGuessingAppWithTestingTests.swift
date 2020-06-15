//
//  ColorGuessingAppWithTestingTests.swift
//  ColorGuessingAppWithTestingTests
//
//  Created by Benjamin Stone on 6/15/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import XCTest
@testable import ColorGuessingAppWithTesting

class ColorGuessingAppWithTestingTests: XCTestCase {

    
    func testGuessColor() {
        let brain = ColorGuessingBrain()
        XCTAssertTrue(brain.guess(color: brain.targetColor))
        XCTAssertFalse(brain.guess(color: UIColor.random()))
    }
    
    func testRandomNearbyColors() {
        let color = UIColor.random()
        let distance = 0.25
        let randomNearbyColor = color.randomNearbyColor(withDistance: distance)
        XCTAssertTrue(abs(color.rgba.red - randomNearbyColor.rgba.red) < CGFloat(distance))
        XCTAssertTrue(abs(color.rgba.green - randomNearbyColor.rgba.green) < CGFloat(distance))
        XCTAssertTrue(abs(color.rgba.blue - randomNearbyColor.rgba.blue) < CGFloat(distance))
    }
    
    func testRGBAFromColor() {
        let colorTuple: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) = (0.4, 0.6, 0.3, 1)
        let color = UIColor(red: colorTuple.red,
                            green: colorTuple.green,
                            blue: colorTuple.blue,
                            alpha: colorTuple.alpha)
        XCTAssertTrue(colorTuple == color.rgba)
        
    }
        
    func testColorsAreSomewhatRandom() {
        var colors = [UIColor]()
        for _ in 0..<1_000_000 {
            colors.append(UIColor.random())
        }
        let onlyUniqueColors = Set(colors).count == colors.count
        XCTAssertTrue(onlyUniqueColors, "Created some duplicate colors")
    }
    

}
