//
//  LoginController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class LoginController: UIViewController {
    
    @IBOutlet weak var userNameView: UIView!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var pwdView: UIView!
    
    @IBOutlet weak var pwd: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var forgetPwd: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameView.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        userNameView.layer.borderWidth = 1.0
        userNameView.layer.cornerRadius = 5.0
        pwdView.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        pwdView.layer.borderWidth = 1.0
        pwdView.layer.cornerRadius = 5.0
        
    }
}
