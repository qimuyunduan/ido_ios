//
//  HPTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Cartography

class HPTableViewController: UITableViewController {
    
    private let pageControl = UIPageControl()
    private let scrollView  = UIScrollView()
    let screen = UIScreen.mainScreen()
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 100))
    private let number  = 3
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator   = false
        scrollView.frame = screen.bounds
        scrollView.pagingEnabled = true
        scrollView.contentOffset = CGPointZero
        scrollView.bounces = false
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: screen.bounds.width * CGFloat(number), height: 100.0)
        pageControl.numberOfPages = number
        pageControl.currentPage = 0
        for index in 0 ..< number {
            let imageView = UIImageView(image: UIImage(named: "GuideImage\(index+1)"))
            imageView.frame = CGRect(x: screen.bounds.width * CGFloat(index), y: 0, width: screen.bounds.width, height: 100)
            scrollView.addSubview(imageView)
        }
        headerView.addSubview(scrollView)
        headerView.addSubview(pageControl)
        
        constrain(scrollView,pageControl){
            
            scrollView,pageControl in
            pageControl.left == scrollView.left + 20
            pageControl.bottom == scrollView.bottom - 20
            
        }
        
        self.tableView.tableHeaderView = headerView
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / screen.bounds.width)
        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage >= number {
            
            pageControl.currentPage = 0
            scrollView.contentOffset = CGPointZero
        }

    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
           }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
            let headerCell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
            headerCell.textLabel?.text = "最新活动"
            headerCell.textLabel?.font = UIFont.boldSystemFontOfSize(18)
            headerCell.textLabel?.textColor = UIColor.redColor()
            headerCell.textLabel?.textAlignment = NSTextAlignment.Left
            headerCell.imageView?.image = UIImage(named: "new")
            headerCell.imageView?.frame = CGRectMake(0, 0, 20, 20)
            return headerCell
        
    }
    
}






