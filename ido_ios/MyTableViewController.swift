//
//  MyTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    
    let sectionOneValues = [["accountName","姓名"],["insureCompany","投保机构"],["moneyLeft","账户余额"]]
    let sectionTwoValues = [["rechargeRecord","充值报销"],["modifyPwd","修改密码"]]
    let sectionThreeValues = [["feedback","意见反馈"],["logout","退出"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let tableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        if indexPath.section == 0 {
            
            tableViewCell.accessoryType = .None
            tableViewCell.imageView?.image = UIImage(named: sectionOneValues[indexPath.row][0])
            tableViewCell.textLabel?.text = sectionOneValues[indexPath.row][1]
        
            return tableViewCell
            
        }else {
        
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
            cell.accessoryType = .DisclosureIndicator
            cell.imageView?.image = UIImage(named: sectionTwoValues[indexPath.row][0])
            cell.textLabel?.text = sectionTwoValues[indexPath.row][1]
            return cell
        
        }
        
        
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.backgroundColor = UIColor.lightGrayColor()
        if section == 1||section == 2 {
            return sectionHeaderView
        }else{
            
            return nil
        }
        
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 40
        }else if section == 2 {
        
            return 20
        
        }
        else{
            return 0
        }
    }

    
}
