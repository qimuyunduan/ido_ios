//
//  RetailerTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import MJRefresh
import Cartography

class RetailerTableViewController: UITableViewController {
    
    
    let screenSize = UIScreen.mainScreen().bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHeader(self.tableView)
    }
    
    func setHeader(tableView:UITableView) -> Void {
        let headerView = UIView(frame: CGRectMake(0,0,screenSize.width,280))
        let collectionView = initCollectionView()
        let gapView = UIView(frame: CGRectMake(0,0,screenSize.width,20))
        let titleView = UIView(frame: CGRectMake(0,0,screenSize.width,40))
        headerView.addSubview(headerView)
        headerView.addSubview(gapView)
        headerView.addSubview(collectionView)
        constrain(clear: <#T##ConstraintGroup#>)
        gapView.backgroundColor = UIColor.lightGrayColor()
        
        
        
        
    }
    func initCollectionView() ->UICollectionView {
        let collectionView = UICollectionView()
        return collectionView
        
    }
}
