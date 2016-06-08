//
//  HPTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit


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
        for index in 0 ..< number {
            let imageView = UIImageView(image: UIImage(named: "GuideImage\(index+1)"))
            imageView.frame = CGRect(x: screen.bounds.width * CGFloat(index), y: 0, width: screen.bounds.width, height: 100)
            scrollView.addSubview(imageView)
        }
        headerView.addSubview(scrollView)
       
        let constraintOne = NSLayoutConstraint(item: pageControl, attribute: .CenterX, relatedBy: .Equal, toItem: headerView, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let constraintTwo = NSLayoutConstraint(item: pageControl, attribute: .CenterY, relatedBy: .Equal, toItem: headerView, attribute: .CenterY, multiplier: 1.0, constant: 0)
        headerView.addSubview(pageControl)
        headerView.bringSubviewToFront(pageControl)
        headerView.addConstraints([constraintOne,constraintTwo])
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
        
        if section == 0 {
            let sectionView = UIView()
            let imageView  = UIImageView(image: UIImage(named: "new"))
            let label = UILabel()
            label.text = "最新活动"
            label.font = UIFont.systemFontOfSize(16)
            label.textColor = UIColor.lightGrayColor()
            sectionView.addSubview(imageView)
            sectionView.addSubview(label)
            sectionView.bringSubviewToFront(label)
            let constraint1 = NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: imageView, attribute: .Right, multiplier: 1.0, constant: 32)
            let constraint2 = NSLayoutConstraint(item: label, attribute: .Bottom, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1.0, constant: 0)
            sectionView.addConstraints([constraint1,constraint2])
            return sectionView
        
            
        }
        return nil
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//    }
    
}






