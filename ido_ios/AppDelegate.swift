//
//  AppDelegate.swift
//  ido_ios
//
//  Created by qimuyunduan on 16/5/25.
//  Copyright © 2016年 qimuyunduan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Umeng config
        MobClick.setLogEnabled(true)
        let umConfig = UMAnalyticsConfig()
        umConfig.appKey = "57453b7367e58eaac9000a8f"
        MobClick.startWithConfigure(umConfig)
        
        //mob sms
        SMSSDK.registerApp("1325d9704e4f7", withSecret:"13648c0e78502e514a914e2aa99f0019")
        
        let storyboard = UIStoryboard(name: "LaunchScreen", bundle: nil)
        let viewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("LaunchViewController") as UIViewController
        
        let launchView = viewController.view;
        let heartImage = launchView.viewWithTag(0)
        
        let ido = launchView.viewWithTag(1)
        ido?.alpha = 0.0
        
        let  mainWindow = UIApplication.sharedApplication().keyWindow
        launchView.frame = mainWindow!.frame
        mainWindow!.addSubview(launchView)
        
        
        UIView.animateWithDuration(1.5, delay: 1, options: .CurveEaseInOut, animations: { ()->Void in
            heartImage?.transform = CGAffineTransformScale((heartImage?.transform)!, 1.5, 1.5)
            
            }, completion: { (finished:Bool) -> Void in
                UIView.animateWithDuration(1, animations:{
                    ()-> Void in
                    heartImage?.transform = CGAffineTransformScale((heartImage?.transform)!, 0.6, 0.6)
                })})
        UIView.animateWithDuration(1.5, delay: 2, options: .CurveLinear, animations: {
            ()->Void in
            ido?.alpha=1.0
            
            }, completion: { (finished:Bool) -> Void in
                // 得到当前应用的版本号
                let infoDictionary = NSBundle.mainBundle().infoDictionary
                let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
                
                // 取出之前保存的版本号
                let userDefaults = NSUserDefaults.standardUserDefaults()
                let appVersion = userDefaults.stringForKey("appVersion")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                // 如果 appVersion 为 nil 说明是第一次启动；如果 appVersion 不等于 currentAppVersion 说明是更新了
                if appVersion == nil || appVersion != currentAppVersion {
                    // 保存最新的版本号
                    userDefaults.setValue(currentAppVersion, forKey: "appVersion")
                    
                    let guideViewController = storyboard.instantiateViewControllerWithIdentifier("GuideViewController") as! GuideViewController
                    self.window?.rootViewController = guideViewController
                }
                
                
                
        })
        
        
        
        
        
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

