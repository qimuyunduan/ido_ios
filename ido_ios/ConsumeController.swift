//
//  consumeController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/2.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class ConsumeController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor =  UIColor(red: 55/255, green: 186/255, blue: 89/255, alpha: 1)
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    }
}

