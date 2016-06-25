//
//  RechargeOrder.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/25.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation

struct RechargeOrder {
    
    let moneyLeft:Int
    let date :String
    let type:RechargeType = .substract
    let number:Int
}
enum RechargeType {
    case plus,substract
}