//
//  LengthViewController.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/3/27.
//

import UIKit

class UnitConverterViewController: UIViewController {
    let converterType: ConverterType!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        // Do any additional setup after loading the view.
        initView()
        initTitle(unit: converterType.unit)
        initInputTextField()
        initOutputTextField()
        initSegmentedControls()
    }
    
    init?(coder: NSCoder, converterType: ConverterType) {
        self.converterType = converterType
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() -> Void {
        view.backgroundColor = .systemGray4
    }
    
    func initTitle(unit: String) -> Void {
        titleLabel.text = unit + " Converter"
        
        // adust font size dynamically
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
    }
    
    func initInputTextField() -> Void {
        inputTextField.clearButtonMode = .always
    }
    
    func initOutputTextField() -> Void {
        outputTextField.isUserInteractionEnabled = false
    }
    
    func initSegmentedControls() -> Void {
        initSegmentedControl(segmentedControlType: .input)
        initSegmentedControl(segmentedControlType: .output)
    }
        
    func initSegmentedControl(segmentedControlType: SegmentedControlType) -> Void {
        let segmentedControl: UISegmentedControl!
        var segmentCount: Int!
        
        // assign input or output segmented control
        switch segmentedControlType {
        case .input:
            segmentedControl = inputSegmentedControl
        case .output:
            segmentedControl = outputSegmentedControl
        }
        
        // decide how many segments
        switch converterType {
        case .lengthConverter:
            if segmentedControlType == .input {
                segmentCount = InputLengthUnit.allCases.count
            }
            else if segmentedControlType == .output {
                segmentCount = OutputLengthUnit.allCases.count
            }
        case .weightConverter:
            if segmentedControlType == .input {
                segmentCount = InputWeightUnit.allCases.count
            }
            else if segmentedControlType == .output {
                segmentCount = OutputWeightUnit.allCases.count
            }
        case .volumeConverter:
            if segmentedControlType == .input {
                segmentCount = InputVolumeUnit.allCases.count
            }
            else if segmentedControlType == .output {
                segmentCount = OutputVolumeUnit.allCases.count
            }
        case .areaConverter:
            if segmentedControlType == .input {
                segmentCount = InputAreaUnit.allCases.count
            }
            else if segmentedControlType == .output {
                segmentCount = OutputAreaUnit.allCases.count
            }
        case .temperatureConverter:
            if segmentedControlType == .input {
                segmentCount = InputTemperatureUnit.allCases.count
            }
            else if segmentedControlType == .output {
                segmentCount = OutputTemperatureUnit.allCases.count
            }
        case .none:
            break
        }
        
        // remove segments
        segmentedControl.removeAllSegments()
        
        // insert segments and set the title
        for i in 0..<segmentCount {
            switch segmentedControlType{
            case .input:
                switch converterType {
                case .lengthConverter:
                    if let unit = InputLengthUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .weightConverter:
                    if let unit = InputWeightUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .volumeConverter:
                    if let unit = InputVolumeUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .areaConverter:
                    if let unit = InputAreaUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .temperatureConverter:
                    if let unit = InputTemperatureUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .none:
                    break
                }
            case .output:
                switch converterType {
                case .lengthConverter:
                    if let unit = OutputLengthUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .weightConverter:
                    if let unit = OutputWeightUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .volumeConverter:
                    if let unit = OutputVolumeUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .areaConverter:
                    if let unit = OutputAreaUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .temperatureConverter:
                    if let unit = OutputTemperatureUnit(rawValue: i) {
                        segmentedControl.insertSegment(withTitle: unit.unitName, at: i, animated: false)
                    }
                case .none:
                    break
                }
            }
            
        }
        
        // set default selected segment
        segmentedControl.selectedSegmentIndex = 0
    }
    
    @IBAction func convertUnit(_ sender: Any) {
        // get number & unit
        let inputText = inputTextField.text! // "" or "xxx"
        let inputSegmentIndex = inputSegmentedControl.selectedSegmentIndex
        let outputSegmentIndex = outputSegmentedControl.selectedSegmentIndex
        
        // unit conversion and show result if possible
        if let inputNumber = Double(inputText) {
            // create a measure
            let inputUnitID = createUnitID(segmentIndex: inputSegmentIndex, segmentedControlType: .input)!
            let outputUnitID = createUnitID(segmentIndex: outputSegmentIndex, segmentedControlType: .output)!
            let inputMeasure = createMeasure(value: inputNumber, unitID: inputUnitID)!
            let outputMeasure = createMeasure(value: 0, unitID: outputUnitID)!
            
            // use Measurement to do unit conversion
            let inputMeasurement = Measurement(value: inputMeasure.value, unit: inputMeasure.unitInMeasurement)
            let outputMeasurement = inputMeasurement.converted(to: outputMeasure.unitInMeasurement)
            
            // show result number
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            outputTextField.text = numberFormatter.string(from: NSNumber(floatLiteral: outputMeasurement.value))
            
            print(inputMeasurement)
            print(outputMeasurement)
        }
        else {
            inputTextField.text = "Enter a number."
        }
        
        // hide keyboard when the convert button is pressed
        view.endEditing(true)
    }
    
    func createUnitID(segmentIndex: Int, segmentedControlType: SegmentedControlType) -> Int? {
        switch segmentedControlType {
        case .input:
            return segmentIndex
        case .output:
            return segmentIndex + inputUnitCount[converterType.rawValue]
        }
    }
    
    func createMeasure(value: Double, unitID: Int) -> Measure? {
        switch converterType {
        case .lengthConverter:
            return Measure(type: .length, value: value, unitID: unitID) ?? nil
        case .weightConverter:
            return Measure(type: .weight, value: value, unitID: unitID) ?? nil
        case .volumeConverter:
            return Measure(type: .volume, value: value, unitID: unitID) ?? nil
        case .areaConverter:
            return Measure(type: .area, value: value, unitID: unitID) ?? nil
        case .temperatureConverter:
            return Measure(type: .temperature, value: value, unitID: unitID) ?? nil
        case .none:
            return nil
        }
    }
    
    
    @IBAction func convertUnitOnUnitChanged(_ sender: Any) {
        if inputTextField.text != "" {
            convertUnit(sender)
        }
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        // hide keyboard when pressing return button on the keyboard
        view.endEditing(true)
        convertUnit(inputTextField)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // hide keyboard when tabbing other areas
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
