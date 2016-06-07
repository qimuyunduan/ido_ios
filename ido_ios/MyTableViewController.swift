//
//  MyTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //修改导航栏返回按钮
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: nil)
       
        }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.5
    }
}