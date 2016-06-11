//
//  UserOrder+CoreDataProperties.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/11.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension UserOrder {

    @NSManaged var money: String?
    @NSManaged var orderImage: NSData?
    @NSManaged var state: String?
    @NSManaged var time: NSDate?
    @NSManaged var title: String?

}
