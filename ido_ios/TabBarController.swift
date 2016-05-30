//
//  TabBarController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/5/30.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if userDefaults.valueForKey("isGuideViewHasShowed") == nil {
            
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

