//
//  SettingsViewController.swift
//  mytips
//
//  Created by Sivasankar, Malu on 1/12/15.
//  Copyright (c) 2015 County Of Santa Clara. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorThemeControl: UISegmentedControl!
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        defaultTipControl.selectedSegmentIndex  = defaults.integerForKey("DefaultTipPercentageIndex")
        colorThemeControl.selectedSegmentIndex = defaults.integerForKey("DefaultColorTheme")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func onSelectionChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "DefaultTipPercentageIndex")
        defaults.synchronize()
    }
    @IBAction func onThemeChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(colorThemeControl.selectedSegmentIndex, forKey: "DefaultColorTheme")
        defaults.synchronize()
   
    }
    @IBAction func returnToMainAction(sender: AnyObject) {
        dismissViewControllerAnimated(true,completion:nil);
    }
}
