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
import Kingfisher
import SwiftyJSON
import Alamofire

class HPTableViewController: UITableViewController {
    
    private let pageControl = UIPageControl()
    private let number  = 3
    private var time = 3
    private var timer:NSTimer? = nil
    private var refreshHeader:MJRefreshGifHeader?
    private var refreshFooter:MJRefreshBackNormalFooter?
    private var data:[AnyObject] = [AnyObject](){
    
        didSet {
        
            self.tableView.reloadData()
        
        }
    
    }
    let screen = UIScreen.mainScreen()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addHeaderView(self.tableView)
        setRefreshViews()

    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getDataFromServer()
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
      
            let cell = tableView.dequeueReusableCellWithIdentifier("homePageCell") as! HPTableViewCell
            let rowData = data[indexPath.row] as! Dictionary<String,String>
            cell.HPCellImage.kf_setImageWithURL(NSURL(string: HOST + "images/chineseDoctor.png")!, placeholderImage: UIImage(named: "mrt"))
            cell.HPCellLabel.text = rowData["title"]
            cell.HPCellTextview.text = rowData["info"]
            return cell
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return data.count
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("你选中某某单元格")
    }
    
    func setRefreshViews() -> Void {
        
        refreshHeader = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: #selector(HPTableViewController.refresh))
        refreshHeader!.setTitle("下拉刷新", forState: MJRefreshState.Idle)
        refreshHeader!.setTitle("正在刷新", forState: MJRefreshState.Refreshing)
        refreshHeader!.setTitle("松开即可刷新", forState: MJRefreshState.Pulling)
        let idleImages = NSMutableArray()
        let idImage = UIImage(named: "wnx00")
        idleImages.addObject(idImage!)
        refreshHeader!.setImages(idleImages as [AnyObject], forState: MJRefreshState.Idle)
        
        let refreshingImages = NSMutableArray()
        let refreshingImage = UIImage(named: "wnx00")!
        refreshingImages.addObject(refreshingImage)
        refreshHeader!.setImages(refreshingImages as [AnyObject], forState: MJRefreshState.Pulling)
        
        let refreshingStartImages = NSMutableArray()
        for i in 0...92 {
            let image = UIImage(named: String(format: "wnx%02d", i))
            refreshingStartImages.addObject(image!)
        }
        
        refreshHeader!.setImages(refreshingStartImages as [AnyObject], forState: MJRefreshState.Refreshing)
        
        // refreshHeader!.stateLabel.hidden = true
       // refreshHeader!.lastUpdatedTimeLabel.hidden = true
        self.tableView.mj_header = refreshHeader
        refreshFooter = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(HPTableViewController.refresh))
        refreshFooter!.setTitle("下拉刷新", forState: MJRefreshState.Idle)
        refreshFooter!.setTitle("正在刷新", forState: MJRefreshState.Refreshing)
        refreshFooter!.setTitle("松开即可刷新", forState: MJRefreshState.Pulling)
        self.tableView.mj_footer = refreshFooter

    }
    

    func refresh() -> Void {
      timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(HPTableViewController.timerAction), userInfo: nil, repeats: true)
    }
    
    func timerAction() -> Void {
        time -= 1
        if time == 0 {
            getDataFromServer()
            if let mytimer = timer {
                mytimer.invalidate()
            }
            if (refreshHeader!.isRefreshing() == true) {
            
                refreshHeader!.endRefreshing()
            }else{
            
                refreshFooter!.endRefreshing()
            }
            time = 3
        }
        
    }
    func getDataFromServer() ->Void {
    
        let url = HOST + "latestActivities"
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    self.data = value as! [AnyObject]
                
                }
            case .Failure(let error):
                print(error)
                
            }
        }
    }
}






