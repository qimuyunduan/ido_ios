//
//  Setting.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/6/11.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit
import CoreData


class Setting: NSManagedObject {

//    var app:AppDelegate?
//    var context:NSManagedObjectContext?
//    
//    
//    func init() -> Void {
//        app = UIApplication.sharedApplication().delegate as? AppDelegate
//        context = app.managedObjectContext
//    }
    
    
    class func getValue(fieldName:String) {
    
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        
        
    
    }
    class func changeValue(fieldName:String,newValue:Bool){
    
        
    
    }

}
