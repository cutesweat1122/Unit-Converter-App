//
//  UnitConverterLayout.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/6/16.
//

import Foundation

struct UnitConverterSizeConfiguration {
    let titleLabel = Size(0.8, 1.0/6)
    let inputTextField = Size(0.6, 3.0/32)
    let outputTextField = Size(0.6, 3.0/32)
    let inputSegmentedControl = Size(0.6, 1.0/16)
    let outputSegmentedControl = Size(0.6, 1.0/16)
    let convertButton = Size(3.0/32, 3.0/32)
}

struct UnitConverterYSpacingConfiguration {
    let titleLabel = CGFloat(1.0/12 * (-1))
    let inputTextField = CGFloat(1.0/32 * (-1))
    let outputTextField = CGFloat(1.0/32 * (-1))
    let convertButton = [CGFloat(3.0/32), CGFloat(3.0/32 * (-1))]
}

struct UnitConverterCornerConfiguration {
    let inputTextField = 0.618
    let outputTextField = 0.618
    let convertButton = 0.2
}

struct Size {
    var widthRatio: CGFloat
    var heightRatio: CGFloat
    init(_ widthRatio: CGFloat, _ heightRatio: CGFloat) {
        self.widthRatio = widthRatio
        self.heightRatio = heightRatio
    }
}
