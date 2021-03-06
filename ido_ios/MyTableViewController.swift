//
//  MyTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    
    var personalInfo = ["name":"","insureCompany":"","moneyLeft":""]
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var insureCompany: UILabel!
    
    @IBOutlet weak var moneyLeft: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //修改导航栏返回按钮
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
        if personalInfo["name"] != "" {
            let startIndex = personalInfo["name"]?.startIndex.advancedBy(2)
            let endIndex = personalInfo["name"]?.endIndex.advancedBy(-4)
            personalInfo["name"] = (personalInfo["name"]?.substringToIndex(startIndex!))! + "****" + (personalInfo["name"]?.substringFromIndex(endIndex!))!
            self.name.text = personalInfo["name"]
            self.insureCompany.text = personalInfo["insureCompany"]
            self.moneyLeft.text = personalInfo["moneyLeft"]
        }
        }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.5
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0) && (indexPath.row == 0) {
            
            let userDefaults = NSUserDefaults.standardUserDefaults()
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let destinationController:UIViewController?
            
            if ((userDefaults.stringForKey("registered")) != nil){
                destinationController = mainStoryBoard.instantiateViewControllerWithIdentifier("loginController") as! LoginController
            }else{
           
                destinationController = mainStoryBoard.instantiateViewControllerWithIdentifier("registerController") as! RegisterController
            }
            self.presentViewController(destinationController!, animated: true, completion: nil)
        }
    }
}