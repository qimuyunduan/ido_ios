//
//  SendMsgController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class SendMsgController: UIViewController {
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var sendMsgButton: UIButton!
    
    @IBOutlet weak var verifyCode: UITextField!
    
    @IBOutlet weak var nextStepButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMsgButton.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        sendMsgButton.layer.borderWidth = 1.0
        sendMsgButton.layer.cornerRadius = 5.0
    }
}
