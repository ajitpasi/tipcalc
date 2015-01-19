//
//  ViewController.swift
//  swifttips
//
//  Created by Ajit Pasi on 1/18/15.
//  Copyright (c) 2015 Ajit Pasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }
    
    override func viewWillAppear(animated: Bool) {
        var tipData = SettingsDataProvider().findTipSettings()
        var average = tipData["average"]!
        var good = tipData["good"]!
        var excellent = tipData["excellent"]!
        
        tipControl.setTitle("\(average)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(good)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(excellent)%", forSegmentAtIndex: 2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        println("User editing bill")
        var tipData = SettingsDataProvider().findTipSettings()
        var average = tipData["average"]!
        var good = tipData["good"]!
        var excellent = tipData["excellent"]!
        var tipPercentages = [average, good, excellent]

        
        var tipPercentage = Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100.0
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
       
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

