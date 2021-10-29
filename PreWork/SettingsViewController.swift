//
//  SettingsViewController.swift
//  PreWork
//
//  Created by Minjie Xia on 10/28/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var rateAdjust3: UITextField!
    @IBOutlet weak var rateAdjust2: UITextField!
    @IBOutlet weak var rateAdjust1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // customized segement fields
    @IBAction func tipAdjustFunc1(_ sender: Any) {
        let defaults = UserDefaults.standard
        let rate1Text:String = rateAdjust1.text!
        defaults.set(rate1Text + "%", forKey: "newRate1")
        defaults.synchronize()
    }
    
    @IBAction func tipAdjustFunc2(_ sender: Any) {
        let defaults = UserDefaults.standard
        let rate2Text:String = rateAdjust2.text!
        defaults.set(rate2Text + "%", forKey: "newRate2")
        defaults.synchronize()
    }
    
    @IBAction func tipAdjustFunc3(_ sender: Any) {
        let defaults = UserDefaults.standard
        let rate3Text:String = rateAdjust3.text!
        defaults.set(rate3Text + "%", forKey: "newRate3")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults=UserDefaults.standard
        let rate1:String = defaults.object(forKey: "newRate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "newRate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "newRate3") as? String ?? ""
        if (rate1 != ""){
            self.rateAdjust1.text=rate1
        }
        if (rate2 != ""){
            self.rateAdjust2.text=rate2
        }
        if (rate3 != ""){
            self.rateAdjust3.text=rate3
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
