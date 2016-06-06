//
//  RetailerController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/2.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class RetailerController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor =  UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }
}

