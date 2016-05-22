//
//  AppDelegate.swift
//  FuelBattle
//
//  Created by Henrique Morbin on 21/05/16.
//  Copyright © 2016 Henrique Morbin. All rights reserved.
//

import UIKit
import Firebase
import Mixpanel


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let mixpanel = Mixpanel.sharedInstanceWithToken(Key.mixpanel)
        
        _ = OneSignal(launchOptions: launchOptions, appId: Key.onesignal, handleNotification: nil)
        
        FIRApp.configure()
        
        mixpanel.track("App Openned", properties: launchOptions)
        
        runAppearance()
        
        application.statusBarStyle = .LightContent
        
        guard let _ = FIRAuth.auth()?.currentUser else {
            FIRAuth.auth()?.signInAnonymouslyWithCompletion { (user, error) in
                print(user, error?.localizedDescription)
            }
            return true
        }
        
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
    
    // MARK: Methods

    func runAppearance() {
        let tabItemShadow = NSShadow()
        tabItemShadow.shadowColor = UIColor.clearColor()
        tabItemShadow.shadowOffset = CGSize.zero
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: R.color.fuelBattle.orange.color(), NSShadowAttributeName: tabItemShadow, NSFontAttributeName: UIFont.systemFontOfSize(12)], forState: .Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: R.color.fuelBattle.gray.color(), NSShadowAttributeName: tabItemShadow, NSFontAttributeName: UIFont.systemFontOfSize(12)], forState: .Normal)
        
        
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics: .Default)
    }

}
