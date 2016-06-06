//
//  MyTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    

    
    let sectionValues = [
        ["accountName","姓名","insureUnit","投保机构","moneyLeft","账户余额"],
        ["rechargeRecord","充值报销","modifyPwd","修改密码"],
        ["feedback","意见反馈","logout","退出"]]
    
    let cellID = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier:cellID)
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let tableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellID)! as! MyTableViewCell
            tableViewCell.accessoryType = .None
            tableViewCell.imageIcon.image = UIImage(named: sectionValues[0][indexPath.row * 2])
            tableViewCell.leftLabel.text = sectionValues[0][indexPath.row * 2 + 1]
            
            return tableViewCell
            
        }else {
            
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
            cell.accessoryType = .DisclosureIndicator
            cell.imageView?.image = UIImage(named: sectionValues[indexPath.section][indexPath.row * 2])
            cell.textLabel?.text = sectionValues[indexPath.section][indexPath.row * 2 + 1]
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
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionValues.count
        
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
