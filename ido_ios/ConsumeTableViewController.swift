//
//  ConsumeTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh

class ConsumeTableViewController: UITableViewController {
    
    
    private var data:[AnyObject] = [AnyObject](){
        didSet{
            
            tableView.reloadData()
        }
    }
    private var time = 3
    private var timer:NSTimer?
    private var footerRefresh:MJRefreshBackNormalFooter?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        footerRefresh = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(ConsumeTableViewController.refresh))
        footerRefresh!.setTitle("下拉刷新", forState: MJRefreshState.Idle)
        footerRefresh!.setTitle("正在刷新", forState: MJRefreshState.Refreshing)
        footerRefresh!.setTitle("松开即可刷新", forState: MJRefreshState.Pulling)
        self.tableView.mj_footer = footerRefresh

    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("consumeCell") as! ConsTableViewCell
        let cellData = data[indexPath.row] as! Dictionary<String,String>
        cell.orderImage.image = UIImage(named: "onlineDrugStore")
        cell.orderTime.text   = cellData["orderTime"]
        cell.orderMoney.text  = cellData["orderMoney"]
        cell.orderTitle.text  = cellData["orderTitle"]
        cell.orderState.text  = cellData["orderState"]

        return cell
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("你选中的某某单元格....")
    }
    
    func refresh() -> Void {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ConsumeTableViewController.timerAction), userInfo: nil, repeats: true)
    }
    
    func getData() -> Void {
        
        let url = HOST + "consumeOrder"
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.data = value as! [AnyObject]
                    print(self.data)
                }
            case .Failure(let error):
                print(error)
                
            }
        }
    }
    
    func timerAction() -> Void {
        time -= 1
        if time == 0 {
            getData()
            if let mytimer = timer {
                mytimer.invalidate()
            }
            footerRefresh?.endRefreshing()
            time = 3
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
