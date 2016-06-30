//
//  ConsumeTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit


class ConsumeTableViewController: UITableViewController {
    
    
    let data:[AnyObject] = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.tableView.registerClass(ConsTableViewCell.self, forCellReuseIdentifier: "consumeCell")

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("consumeCell") as! ConsTableViewCell
//        let cellData = data[indexPath.row]
//        cell.orderImage.image = UIImage(named: "onlineDrugStore")
//        cell.orderTime.text   = cellData["orderTime"]
//        cell.orderMoney.text  = cellData["orderMoney"]
//        cell.orderTitle.text  = cellData["orderTitle"]
//        cell.orderState.text  = cellData["orderState"]

        return cell
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("你选中的某某单元格....")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
