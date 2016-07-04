//
//  RegisterController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class RegisterController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var registerPhone: UITextField!
    
    @IBOutlet weak var sendMsgButton: UIButton!
    
    @IBOutlet weak var verifyCode: UITextField!
    
    @IBOutlet weak var nextStep: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLeftItem()
        
        self.navigationController?.navigationBar.barTintColor =  UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        sendMsgButton.layer.borderWidth = 1.0
        sendMsgButton.layer.borderColor = UIColor(red: 0.46, green: 0.66, blue: 1, alpha: 1).CGColor
        sendMsgButton.layer.cornerRadius = 5.0
        //显示数字键盘
        registerPhone.keyboardType = UIKeyboardType.NumberPad
        verifyCode.keyboardType = UIKeyboardType.NumberPad
        verifyCode.userInteractionEnabled = false
        verifyCode.delegate = self
        nextStep.userInteractionEnabled = false
        sendMsgButton.addTarget(self, action: #selector(RegisterController.sendMsg), forControlEvents: UIControlEvents.TouchUpInside)
    }
    func addLeftItem() -> Void {
        let leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(RegisterController.cancelRegister))
        
        self.navigationItem.setLeftBarButtonItem(leftBarButtonItem, animated: true)
        
    }
    
    func cancelRegister() -> Void {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        
    
        nextStep.userInteractionEnabled = true
            
        nextStep.setBackgroundImage(UIImage(named: "nextStepEnabled"), forState: UIControlState.Normal)
        
        
    }
    
    func sendMsg() -> Void {
        
        if checkPhoneNumber(registerPhone.text!) == true {
            verifyCode.userInteractionEnabled = true
            SMSSDK.getVerificationCodeByMethod(SMSGetCodeMethodSMS, phoneNumber: registerPhone.text, zone: "86", customIdentifier: nil, result: nil)
        }
       
    }
    
    @IBAction func nextStep(sender: AnyObject) {
        
        verifyCode.resignFirstResponder()
        if verifyCode.text?.characters.count == 4 {

            let setPassController        = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("setPwdController") as! SetPwdController
            setPassController.personName = self.registerPhone.text

            SMSSDK.commitVerificationCode(verifyCode.text, phoneNumber: registerPhone.text, zone: "86", result:
                { (error: NSError!) -> Void in
                    if(error == nil){
                        print("恭喜您，验证成功！")
                        self.performSegueWithIdentifier("setPwd", sender: self)
                        
                    }else{
                        print("很抱歉，验证失败！")
                    }
                })
            }
    }
    
    func checkPhoneNumber(phoneNumber:String) -> Bool {

        //正则表达式是否符合电话号码格式
        let mobile          = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
        let  CM             = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
        let  CU             = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
        let  CT             = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        let regextestcm     = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu     = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct     = NSPredicate(format: "SELF MATCHES %@" ,CT)
        if ((regextestmobile.evaluateWithObject(phoneNumber) == true)
            || (regextestcm.evaluateWithObject(phoneNumber)  == true)
            || (regextestct.evaluateWithObject(phoneNumber) == true)
            || (regextestcu.evaluateWithObject(phoneNumber) == true))
        {   //收回键盘
            registerPhone.resignFirstResponder()

            return true
        }
        else
        {
            return false
        }
    }
    
    
    
    
}
