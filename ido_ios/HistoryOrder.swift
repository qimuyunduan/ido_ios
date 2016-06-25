//
//  HistoryOrder.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/25.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import Foundation

struct HistoryOrder {
    
    let image :String
    let time:String
    let title:String
    let money:Int
    let status:OrderStatus
    let id:String
    
}
enum OrderStatus {
    case canceled,completed,frozened
}