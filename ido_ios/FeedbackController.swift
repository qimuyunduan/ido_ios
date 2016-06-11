//
//  FeedbackController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class FeedbackController: UIViewController {
    
    @IBOutlet weak var advices: UITextView!
    
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var dialButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        advices.layer.borderWidth = 1.0
        advices.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        advices.layer.cornerRadius = 5
    }
}
