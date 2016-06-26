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

class RetailerTableViewController: UITableViewController,UICollectionViewDataSource,UICollectionViewDelegate {


    let screenSize            = UIScreen.mainScreen().bounds
    let collectionCells       = [
        ["name":"药房","pic":"drugStore"],
        ["name":"网上药店","pic":"onlineDrugStore"],
        ["name":"体检","pic":"physicalCheck"],
        ["name":"口腔","pic":"mouth"],
        ["name":"疗养院","pic":"treatment"],
        ["name":"中医","pic":"chineseDoctor"],
        ["name":"特需","pic":"specialNeed"],
        ["name":"医院","pic":"hospital"]]
    var  collectionView :UICollectionView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setHeader(self.tableView)
        
    }

    func setHeader(tableView:UITableView) -> Void {
        
    let headerView            = UIView(frame: CGRectMake(0,0,screenSize.width,280))
    let collectionView        = initCollectionView()
    let gapView               = UIView(frame: CGRectMake(0,0,screenSize.width,20))
    let titleView             = initTitleView()
        headerView.addSubview(headerView)
        headerView.addSubview(gapView)
        headerView.addSubview(collectionView)
        gapView.backgroundColor   = UIColor.lightGrayColor()
        headerView.backgroundColor = UIColor.whiteColor()
        constrain(collectionView,gapView,titleView) {

            collectionView,gapView,titleView in
                gapView.top   == collectionView.bottom
                titleView.top == gapView.bottom


        }
        tableView.tableHeaderView = headerView

    }
    func initCollectionView() ->UICollectionView {
        collectionView        = UICollectionView(frame: CGRectMake(0, 0, screenSize.width, 220))
        collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Ccell")
        collectionView!.dataSource = self
        collectionView!.delegate   = self
        return collectionView!

    }
    func initTitleView() -> UIView {
    let titleView             = UIView(frame: CGRectMake(0,0,screenSize.width,40))
    let imageView             = UIImageView(image: UIImage(named: "new"))
    let label                 = UILabel()
    label.text                = "最新活动"
    label.font                = UIFont.systemFontOfSize(16)
    label.textAlignment       = NSTextAlignment.Left
        titleView.addSubview(imageView)
        titleView.addSubview(label)
        constrain(titleView,imageView,label) {

            titleView,imageView,label in
                imageView.centerY == titleView.centerY
                label.centerY     == titleView.centerY
                label.left        == imageView.right + 20
                imageView.left    == titleView.left + 20
        }
        return titleView
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionCells.count
    }
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        <#code#>
//    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let Ccell = (self.collectionView?.dequeueReusableCellWithReuseIdentifier("Ccell", forIndexPath: indexPath))! as UICollectionViewCell? {
            let info = collectionCells[indexPath.item]
            let image = UIImageView(image: UIImage(named: info["pic"]!))
            image.frame = Ccell.bounds
            image.contentMode = .ScaleAspectFit
            let label = UILabel(frame:CGRectMake(0,5,Ccell.bounds.size.width,20))
            label.text = info["name"]
            label.font = UIFont.systemFontOfSize(16)
            label.textAlignment = .Center
            Ccell.addSubview(image)
            Ccell.addSubview(label)
            return Ccell
            
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("你选中了第" + String(indexPath.section)+"区" )
        print("第"+String(indexPath.row)+"行")
        print("第"+String(indexPath.item)+"个")
    }
}
