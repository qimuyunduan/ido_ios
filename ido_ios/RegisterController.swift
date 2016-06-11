//
//  RegisterController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class RegisterController: UIViewController {
    
    @IBOutlet weak var registerPhone: UITextField!
    
    @IBOutlet weak var sendMsgButton: UIButton!
    
    @IBOutlet weak var verifyCode: UITextField!
    
    @IBOutlet weak var nextStep: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMsgButton.layer.borderWidth = 1.0
        sendMsgButton.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        sendMsgButton.layer.cornerRadius = 5.0
        
    }
}
