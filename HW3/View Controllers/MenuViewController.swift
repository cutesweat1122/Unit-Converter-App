//
//  MenuViewController.swift
//  HW3
//
//  Created by 蘇子涵 on 2023/3/27.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    func initView() -> Void {
        view.backgroundColor = .systemGray4
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
