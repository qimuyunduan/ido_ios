//
//  HistoryOrder.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/25.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation

struct HistoryOrder {
    
    let orderImage:String
    let orderTime:String
    let orderTitle:String
    let orderMoney:Float
    let orderStatus:OrderStatus
    
}
enum OrderStatus:Int {
    case canceled,completed,frozened
}