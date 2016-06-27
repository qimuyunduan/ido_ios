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
    let imgView:UIImageView?
    let label:UILabel?
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.contentView.frame = CGRectMake(0, 0, width * 0.25, width * 0.25)
        //初始化各种控件
        let contentView = self.contentView
        
        imgView = UIImageView()
        self .addSubview(imgView!)
        label = UILabel()
        label?.numberOfLines = 1
        label?.font = UIFont.boldSystemFontOfSize(16)
        label?.textColor = UIColor.lightGrayColor()
        label?.textAlignment = NSTextAlignment.Left
        self .addSubview(label!)
        constrain(contentView,imgView,label) {
        contentView,imgView,label in
            imgView.width == contentView.width * 0.6
            imgView.height == imgView.width
            imgView.center == contentView.center
            label.top == imgView.bottom + 10
        
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}