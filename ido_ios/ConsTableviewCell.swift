//
//  ConsTableviewCell.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/11.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class ConsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderImage: UIImageView!
    
    @IBOutlet weak var orderTime: UILabel!
    
    @IBOutlet weak var orderTitle: UILabel!
    
    @IBOutlet weak var orderMoney: UILabel!
    
    @IBOutlet weak var orderState: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
