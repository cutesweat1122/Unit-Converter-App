//
//  LengthViewController.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/3/27.
//

import UIKit

class LengthViewController: UIViewController {

    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputTextField: UITextField!
    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initInputTextField()
        initOutputTextField()
        initSegmentedControls()
    }
    
    func initView() -> Void {
        view.backgroundColor = .systemGray4
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
        
    func initSegmentedControl(segmentedControlType: segmentedControlType) -> Void {
        // assign input or output segmented control
        let segmentedControl: UISegmentedControl!
        let segmentCount: Int!
        switch segmentedControlType {
        case .input:
            segmentedControl = inputSegmentedControl
            segmentCount = InputLengthUnit.allCases.count
        case .output:
            segmentedControl = outputSegmentedControl
            segmentCount = OutputLengthUnit.allCases.count
        }
        
        // remove segments
        segmentedControl.removeAllSegments()
        
        // insert segments and set the title
        for i in 0..<segmentCount {
            switch segmentedControlType{
            case .input:
                if let lengthUnit = InputLengthUnit(rawValue: i) {
                    segmentedControl.insertSegment(withTitle: lengthUnit.unitName, at: i, animated: false)
                }
            case .output:
                if let lengthUnit = OutputLengthUnit(rawValue: i) {
                    segmentedControl.insertSegment(withTitle: lengthUnit.unitName, at: i, animated: false)
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
//        let inputUnitTitle = inputSegmentedControl.titleForSegment(at: inputSegmentIndex)!
//        let outputUnitTitle = outputSegmentedControl.titleForSegment(at: outputSegmentIndex)!
        
        // unit conversion and show result if possible
        if let inputNumber = Double(inputText) {
            if let inputLengthUnit = InputLengthUnit(rawValue: inputSegmentIndex), let outputLengthUnit = OutputLengthUnit(rawValue: outputSegmentIndex) {
                // use Measurement to do unit conversion
                let inputMeasurement = Measurement(value: inputNumber, unit: inputLengthUnit.unitLength)
                let outputMeasurement = inputMeasurement.converted(to: outputLengthUnit.unitLength)
                
                // show result number
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                outputTextField.text = numberFormatter.string(from: NSNumber(floatLiteral: outputMeasurement.value))
//                outputTextField.text = String(outputMeasurement.value)
            }
        }
        else {
            inputTextField.text = "Enter a number."
        }
        
        // hide keyboard when the convert button is pressed
        view.endEditing(true)
        
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
