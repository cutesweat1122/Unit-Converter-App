//
//  Length.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/4/9.
//

import Foundation

class Measure {
    var type: MeasureType
    var value: Double
    var unitName: String
    var unitID: Int
    var unitInMeasurement: UnitLength

    
    init?(type: MeasureType, value: Double, unitID: Int) {
        self.type = type
        self.value = value
        self.unitID = unitID
        switch type {
        case .length:
            if let unit = LengthUnit(rawValue: unitID) {
                self.unitName = unit.unitName
                self.unitInMeasurement = unit.unitInMeasurement
            }
            else {
                return nil
            }
        }
    }
}

enum LengthUnit: Int {
    case mi,yd,ft, inch, km,m,cm
    
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
        case .km:
            return "km"
        case .m:
            return "m"
        case .cm:
            return "cm"
        }
    }
    
    var unitInMeasurement: UnitLength {
        switch self {
        case .mi:
            return UnitLength.miles
        case .yd:
            return UnitLength.yards
        case .ft:
            return UnitLength.feet
        case .inch:
            return UnitLength.inches
        case .km:
            return UnitLength.kilometers
        case .m:
            return UnitLength.meters
        case .cm:
            return UnitLength.centimeters
        }
    }
}

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
}

//UnitMass.pounds
//UnitMass.ounces
//UnitMass.kilograms
//UnitMass.grams
//
//UnitVolume.gallons
//UnitVolume.pints
//UnitVolume.fluidOunces
//
//UnitArea.squareFeet
//UnitArea.acres
//UnitArea.squareMeters
//
//UnitTemperature.fahrenheit
//UnitTemperature.celsius




let inputUnitCount = [InputLengthUnit.allCases.count]
//let inputUnitCount = [InputLengthUnit.allCases.count, InputWeightUnit.allCases.count, InputVolumeUnit.allCases.count, InputAreaUnit.allCases.count, InputTemperatureUnit.allCases.count]
let outputUnitCount = [OutputLengthUnit.allCases.count]
//let outputUnitCount = [OutputLengthUnit.allCases.count, OutputWeightUnit.allCases.count, OutputVolumeUnit.allCases.count, OutputAreaUnit.allCases.count, OutputTemperatureUnit.allCases.count]
