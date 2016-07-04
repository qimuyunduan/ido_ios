//
//  SetPwdController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SetPwdController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var setPwd: UITextField!
    
    @IBOutlet weak var confirmPwd: UITextField!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var personName :String?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmPwd.delegate = self
        confirmButton.addTarget(self, action: #selector(SetPwdController.login), forControlEvents: UIControlEvents.TouchUpInside)
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        confirmButton.setBackgroundImage(UIImage(named: "loginEnabled"), forState: UIControlState.Normal)
    }
    func login() -> Void {
        
        if setPwd.text == confirmPwd.text && setPwd.text?.characters.count >= 6 {
            
            let destinationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("myTableViewController") as! MyTableViewController
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(true, forKey: "registered")
            userDefaults.setObject(personName, forKey: "userName")
            self.presentViewController(destinationController, animated: false, completion: nil)

        }
    }
    func newUser() -> Bool {
        <#function body#>
    }
    
}
