//
//  SettingController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/8.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class SettingController:UITableViewController {

    @IBOutlet weak var rememberUsername: UISwitch!
    
    @IBOutlet weak var autoLogin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }

}

