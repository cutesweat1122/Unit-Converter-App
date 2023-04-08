//
//  Units.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/4/8.
//

import Foundation

enum InputLengthUnit: Int, CaseIterable {
    case mi,yd,ft, inch

    var unitName: String {
        switch self {
        case .mi:
            return "mi"
        case .yd:
            return "yd"
        case .ft:
            return "ft"
        case .inch:
            return "inch"
        }
    }
    
    var unitLength: UnitLength {
        switch self {
        case .mi:
            return UnitLength.miles
        case .yd:
            return UnitLength.yards
        case .ft:
            return UnitLength.feet
        case .inch:
            return UnitLength.inches
        }
    }
    
}

enum OutputLengthUnit: Int, CaseIterable {
    case km,m,cm

    var unitName: String {
        switch self {
        case .km:
            return "km"
        case .m:
            return "m"
        case .cm:
            return "cm"
        }
    }
    
    var unitLength: UnitLength {
        switch self {
        case .km:
            return UnitLength.kilometers
        case .m:
            return UnitLength.meters
        case .cm:
            return UnitLength.centimeters
        }
    }
}
