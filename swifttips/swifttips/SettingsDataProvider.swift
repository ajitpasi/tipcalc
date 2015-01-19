//
//  SettingsDataProvider.swift
//  swifttips
//
//  Created by Ajit Pasi on 1/19/15.
//  Copyright (c) 2015 Ajit Pasi. All rights reserved.
//

import Foundation

class SettingsDataProvider{
    func findTipSettings() -> [String : Int] {
        // Do any additional setup after loading the view.
        
        var average = 10
        var good = 15
        var excellent = 20
        
        if let averageFromDisk : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("average") {
            average = averageFromDisk as Int
        }
        if let goodFromDisk : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("good") {
            good = goodFromDisk as Int
        }
        if let excellentFromDisk : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("excellent") {
            excellent = excellentFromDisk as Int
        }
        
        var tipData = ["average":average, "good":good, "excellent":excellent]
        return tipData
    }
}

