//
//  MyController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/2.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MyController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //修改导航栏背景色
        self.navigationBar.barTintColor =  UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1)
        //修改导航栏标题文字颜色
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        //修改导航栏按钮颜色
        self.navigationBar.tintColor = UIColor.whiteColor()
        
    }
    
}
