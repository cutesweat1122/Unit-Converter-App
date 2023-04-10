//
//  ViewControllerType.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/4/9.
//

import Foundation

enum ConverterType: Int {
    case lengthConverter
    case weightConverter
    case volumeConverter
    case areaConverter
    case temperatureConverter
    
    var unit: String {
        switch self {
        case .lengthConverter:
            return "Length"
        case .weightConverter:
            return "Weight"
        case .volumeConverter:
            return "Volume"
        case .areaConverter:
            return "Area"
        case .temperatureConverter:
            return "Temperature"
        }
    }
}
