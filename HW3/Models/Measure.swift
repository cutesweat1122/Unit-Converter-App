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
    var unitInMeasurement: Dimension

    
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
        case .weight:
            if let unit = WeightUnit(rawValue: unitID) {
                self.unitName = unit.unitName
                self.unitInMeasurement = unit.unitInMeasurement
            }
            else {
                return nil
            }
        case .volume:
            if let unit = VolumeUnit(rawValue: unitID) {
                self.unitName = unit.unitName
                self.unitInMeasurement = unit.unitInMeasurement
            }
            else {
                return nil
            }
        case .area:
            if let unit = AreaUnit(rawValue: unitID) {
                self.unitName = unit.unitName
                self.unitInMeasurement = unit.unitInMeasurement
            }
            else {
                return nil
            }
        case .temperature:
            if let unit = TemperatureUnit(rawValue: unitID) {
                self.unitName = unit.unitName
                self.unitInMeasurement = unit.unitInMeasurement
            }
            else {
                return nil
            }
        }
        
    }
}

// length
enum LengthUnit: Int {
    case mi, yd, ft, inch, km, m, cm
    
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
    case mi, yd, ft, inch
    
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
    case km, m, cm
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

// weight
enum WeightUnit: Int {
    case lb, oz, kg, g
    
    var unitName: String {
        switch self {
        case .lb:
            return "lb"
        case .oz:
            return "oz"
        case .kg:
            return "kg"
        case .g:
            return "g"
        }
    }
    
    var unitInMeasurement: UnitMass {
        switch self {
        case .lb:
            return UnitMass.pounds
        case .oz:
            return UnitMass.ounces
        case .kg:
            return UnitMass.kilograms
        case .g:
            return UnitMass.grams
        }
    }
}

enum InputWeightUnit: Int, CaseIterable {
    case lb, oz
    
    var unitName: String {
        switch self {
        case .lb:
            return "lb"
        case .oz:
            return "oz"
        }
    }
}

enum OutputWeightUnit: Int, CaseIterable {
    case kg, g
    var unitName: String {
        switch self {
        case .kg:
            return "kg"
        case .g:
            return "g"
        }
    }
}

// volume
enum VolumeUnit: Int {
    case gal, pt, flOz, l, ml
    
    var unitName: String {
        switch self {
        case .gal:
            return "gal"
        case .pt:
            return "pt"
        case .flOz:
            return "fl oz"
        case .l:
            return "L"
        case .ml:
            return "mL"
        }
    }
    
    var unitInMeasurement: UnitVolume {
        switch self {
        case .gal:
            return UnitVolume.gallons
        case .pt:
            return UnitVolume.pints
        case .flOz:
            return UnitVolume.fluidOunces
        case .l:
            return UnitVolume.liters
        case .ml:
            return UnitVolume.milliliters
        }
    }
}

enum InputVolumeUnit: Int, CaseIterable {
    case gal, pt, flOz
    
    var unitName: String {
        switch self {
        case .gal:
            return "gal"
        case .pt:
            return "pt"
        case .flOz:
            return "fl oz"
        }
    }
}

enum OutputVolumeUnit: Int, CaseIterable {
    case l, ml
    var unitName: String {
        switch self {
        case .l:
            return "L"
        case .ml:
            return "mL"
        }
    }
}

// area
enum AreaUnit: Int {
    case acre, sqFt, sqM
    
    var unitName: String {
        switch self {
        case .acre:
            return "acre"
        case .sqFt:
            return "sq ft"
        case .sqM:
            return "sq m"
        }
    }
    
    var unitInMeasurement: UnitArea {
        switch self {
        case .acre:
            return UnitArea.acres
        case .sqFt:
            return UnitArea.squareFeet
        case .sqM:
            return UnitArea.squareMeters
        }
    }
}

enum InputAreaUnit: Int, CaseIterable {
    case acre, sqFt
    
    var unitName: String {
        switch self {
        case .acre:
            return "acre"
        case .sqFt:
            return "sq ft"
        }
    }
}

enum OutputAreaUnit: Int, CaseIterable {
    case sqM
    var unitName: String {
        switch self {
        case .sqM:
            return "sq m"
        }
    }
}

// temperature
enum TemperatureUnit: Int {
    case f, c
    
    var unitName: String {
        switch self {
        case .f:
            return "°F"
        case .c:
            return "°C"
        }
    }
    
    var unitInMeasurement: UnitTemperature {
        switch self {
        case .f:
            return UnitTemperature.fahrenheit
        case .c:
            return UnitTemperature.celsius
        }
    }
}

enum InputTemperatureUnit: Int, CaseIterable {
    case f
    
    var unitName: String {
        switch self {
        case .f:
            return "°F"
        }
    }
}

enum OutputTemperatureUnit: Int, CaseIterable {
    case c
    var unitName: String {
        switch self {
        case .c:
            return "°C"
        }
    }
}


let inputUnitCount = [InputLengthUnit.allCases.count, InputWeightUnit.allCases.count, InputVolumeUnit.allCases.count, InputAreaUnit.allCases.count, InputTemperatureUnit.allCases.count]
let outputUnitCount = [OutputLengthUnit.allCases.count, OutputWeightUnit.allCases.count, OutputVolumeUnit.allCases.count, OutputAreaUnit.allCases.count, OutputTemperatureUnit.allCases.count]
