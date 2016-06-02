//
//  HomePageController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/2.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class HomePageController: UINavigationController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension HomePageController:UITableViewDelegate {

    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        <#code#>
    }


}

extension HomePageController:UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        <#code#>
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        <#code#>
    }

}