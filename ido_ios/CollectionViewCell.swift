//
//  CollectionViewCell.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/27.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import Cartography

class CollectionViewCell: UICollectionViewCell {
    
    let width = UIScreen.mainScreen().bounds.size.width
    var imgView:UIImageView?
    var label:UILabel?
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let contentView = self.contentView
        //初始化各种控件
        imgView = UIImageView()
        imgView?.contentMode = .ScaleAspectFit
        self.addSubview(imgView!)
        label = UILabel()
        label?.numberOfLines = 1
        label?.font = UIFont.boldSystemFontOfSize(16)
        label?.textColor = UIColor.lightGrayColor()
        label?.textAlignment = NSTextAlignment.Left
        self.addSubview(label!)
        constrain(contentView,imgView!,label!) {
            contentView,imgView,label in
            imgView.center == contentView.center
            imgView.width == contentView.width * 0.6
            imgView.height == imgView.width
            imgView.bottom == label.top - 10
            label.bottom == contentView.bottom - 5
            label.centerX == contentView.centerX
        
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}