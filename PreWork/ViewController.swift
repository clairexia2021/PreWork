//
//  ViewController.swift
//  PreWork
//
//  Created by Minjie Xia on 10/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let rate1:String = defaults.object(forKey: "newRate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "newRate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "newRate3") as? String ?? ""
        if (rate1 != ""){
            self.tipControl.setTitle(rate1, forSegmentAt: 0)
        }
        if (rate2 != ""){
            self.tipControl.setTitle(rate2, forSegmentAt: 1)
        }
                
        if (rate3 != ""){
            self.tipControl.setTitle(rate3, forSegmentAt: 2)
        }
        calculateTip(animated as AnyObject)
    }
        
    @IBAction func calculateTip(_ sender: Any) {
        // get bill amount from text field input
        let bill = Double(self.billAmountTextField.text!) ?? 0
        
        // get total tip by multiplying tip * tipPercentage
        var tipPercentageString=String(self.tipControl.titleForSegment(at: self.tipControl.selectedSegmentIndex)!)
        tipPercentageString=tipPercentageString.replacingOccurrences(of: "%", with: "")
        let tipPercent = Double(tipPercentageString) ?? 0
        let tip:Double = Double(bill * tipPercent / 100)
        let total = bill + tip
        
        // update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    

}

