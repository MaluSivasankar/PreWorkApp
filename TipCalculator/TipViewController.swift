//
//  TipViewController.swift
//  mytips
//
//  Created by Sivasankar, Malu on 1/12/15.
//  Copyright (c) 2015 County Of Santa Clara. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        var defaults = NSUserDefaults.standardUserDefaults()
        
        //Default Tip Percentage Index
        tipControl.selectedSegmentIndex  = defaults.integerForKey("DefaultTipPercentageIndex")
        var billAmount = (billField.text as NSString).doubleValue
        //Recalculate Tip
        if(billAmount > 0)
        {
             self.calculateAndDisplayTip()
        }
        
        //Default Theme Color Index
        var defaultColorThemeIndex = defaults.integerForKey("DefaultColorTheme")
        if(defaultColorThemeIndex == 0)
        {
            //light green (144,238,144)
            self.view.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 1.0)
        }
        else
        {
            //(0,100,0)
            self.view.backgroundColor = UIColor(red: 0, green: 100/255, blue: 0, alpha: 1.0)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func calculateAndDisplayTip()
    {
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func onEditingChanged(sender: AnyObject) {
        self.calculateAndDisplayTip()
       
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

