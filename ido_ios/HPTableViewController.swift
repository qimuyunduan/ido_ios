//
//  HPTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Cartography
import MJRefresh

class HPTableViewController: UITableViewController {
    
    private let pageControl = UIPageControl()
    private let number  = 3
    let screen = UIScreen.mainScreen()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addHeaderView(self.tableView)
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
    func addHeaderView(tableView:UITableView) -> Void {
     
        let scrollView  = UIScrollView()
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: screen.bounds.width, height: 140))
        let ADView = UIView(frame: CGRect(x: 0, y: 0, width: screen.bounds.width, height: 100))
       
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
        ADView.addSubview(scrollView)
        ADView.addSubview(pageControl)
        
        constrain(ADView,pageControl){
            
            ADView,pageControl in
            pageControl.left == ADView.left + 20
            pageControl.bottom == ADView.bottom - 10
            
        }
        headerView.addSubview(ADView)
        let titleView = UIView()
        let new = UIImageView(image: UIImage(named: "new"))
        let label = UILabel()
        titleView.addSubview(new)
        titleView.addSubview(label)
        
        label.font = UIFont.systemFontOfSize(16)
        label.text = "最新活动"
        constrain(titleView,new,label) { titleView,new,label in
            titleView.height == 40
            titleView.width == screen.bounds.width
            new.left == titleView.left + 20
            new.centerY  == titleView.centerY
            label.centerY == titleView.centerY
            label.left == new.right + 20
            
        }
        headerView.addSubview(titleView)
        constrain(ADView,titleView) {
        
        ADView,titleView in
            titleView.top  == ADView.bottom
        
        }
        tableView.tableHeaderView = headerView
        
        
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






