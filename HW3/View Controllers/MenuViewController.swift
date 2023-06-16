//
//  MenuViewController.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/3/27.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet weak var lengthButton: UIButton!
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var areaButton: UIButton!
    @IBOutlet weak var temperatureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        initButtons()
    }
    
    func initView() -> Void {
        view.backgroundColor = .systemGray4
    }
    
    func initButtons() -> Void {
        lengthButton.titleLabel?.adjustsFontSizeToFitWidth = true
        lengthButton.titleLabel?.minimumScaleFactor = 0.5
        weightButton.titleLabel?.adjustsFontSizeToFitWidth = true
        weightButton.titleLabel?.minimumScaleFactor = 0.5
        volumeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        volumeButton.titleLabel?.minimumScaleFactor = 0.5
        areaButton.titleLabel?.adjustsFontSizeToFitWidth = true
        areaButton.titleLabel?.minimumScaleFactor = 0.5
        temperatureButton.titleLabel?.adjustsFontSizeToFitWidth = true
        temperatureButton.titleLabel?.minimumScaleFactor = 0.5
    }
    

    @IBAction func showUnitConverterViewController(_ sender: UIButton) {
        performSegue(withIdentifier: "showConverter", sender: sender)
    }
    
    @IBSegueAction func sendConverterType(_ coder: NSCoder, sender: UIButton) -> UnitConverterViewController? {
        if let converterType = ConverterType(rawValue: sender.tag) {
            return UnitConverterViewController(coder: coder, converterType: converterType)
        }
        else {
            return UnitConverterViewController(coder: coder)
        }
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
