//
//  RetailerTableViewCell.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/11.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
class RetailerTableViewCell: UITableViewCell {
    

    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var bargainPrice: UILabel!
    
    @IBOutlet weak var introInfo: UITextView!
    
    @IBOutlet weak var salesCount: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
