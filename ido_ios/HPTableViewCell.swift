//
//  HPTableViewCell.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/11.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

class HPTableViewCell: UITableViewCell {
    
    @IBOutlet weak var HPCellImage: UIImageView!
    
    @IBOutlet weak var HPCellLabel: UILabel!
    
    @IBOutlet weak var HPCellTextview: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
