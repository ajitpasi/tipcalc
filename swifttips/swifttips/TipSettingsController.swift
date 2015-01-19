//
//  TipSettingsController.swift
//  swifttips
//
//  Created by Ajit Pasi on 1/18/15.
//  Copyright (c) 2015 Ajit Pasi. All rights reserved.
//

import UIKit

class TipSettingsController: UIViewController {
    @IBOutlet weak var averageField: UITextField!
    @IBOutlet weak var goodField: UITextField!
    @IBOutlet weak var excellentField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        var tipData = SettingsDataProvider().findTipSettings()
        var average = tipData["average"]!
        var good = tipData["good"]!
        var excellent = tipData["excellent"]!

        averageField.text = "\(average)"
        goodField.text = "\(good)"
        excellentField.text = "\(excellent)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        averageField.text =  "\(validPercentage(averageField.text))"
        goodField.text = "\(validPercentage(goodField.text))"
        excellentField.text = "\(validPercentage(excellentField.text))"
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(averageField.text.toInt(), forKey: "average")
        userDefaults.setObject(goodField.text.toInt(), forKey: "good")
        userDefaults.setObject(excellentField.text.toInt(), forKey: "excellent")
        userDefaults.synchronize()
        
        if let averageFromDisk : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("average") {
            println("averageFromDisk = \(averageFromDisk)")
        }
    }
    
    func validPercentage(amountString : String) -> Int {
        if(amountString.isEmpty){
            return 0
        }
        
        var amount = amountString.toInt()!
        if(amount < 100){
            return amount
        }
        
        var lastDigit = amount % 10
        return (amount - lastDigit) / 10
    }
}
