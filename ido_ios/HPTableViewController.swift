//
//  HPTableViewController.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/3.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit


class HPTableViewController: UITableViewController {
    
    private let pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 100, height: 37))
    private let scrollView  = UIScrollView()
    let screen = UIScreen.mainScreen()
    let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 200))
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
        scrollView.contentSize = CGSize(width: screen.bounds.width * CGFloat(number), height: 200.0)
        for index in 0 ..< number {
            let imageView = UIImageView(image: UIImage(named: "GuideImage\(index+1)"))
            imageView.frame = CGRect(x: screen.bounds.width * CGFloat(index), y: 0, width: screen.bounds.width, height: 200)
            scrollView.addSubview(imageView)
        }
        headerView.addSubview(scrollView)
        let constraintOne = NSLayoutConstraint(item: headerView, attribute: .CenterX, relatedBy: .Equal, toItem: pageControl, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let constraintTwo = NSLayoutConstraint(item: headerView, attribute: .Bottom, relatedBy: .Equal, toItem: pageControl, attribute: .Bottom, multiplier: 1.0, constant: -30)
        headerView.addSubview(pageControl)
        headerView.addConstraints([constraintOne,constraintTwo])
        self.tableView.tableHeaderView = headerView
        
        
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
    
}






