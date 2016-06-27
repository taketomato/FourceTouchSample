//
//  AppDelegate.swift
//  ForceTouchSample
//
//  Created by tchiba on 2016/06/22.
//  Copyright © 2016年 tchiba. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let icon = UIApplicationShortcutIcon(type: .Alarm)
        let item = UIApplicationShortcutItem(type: "next",
                                             localizedTitle: "コードで実装したよ",
                                             localizedSubtitle: "下に出てくる文字",
                                             icon: icon,
                                             userInfo: nil)
        UIApplication.sharedApplication().shortcutItems = [item]
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
    
    // ショートカットから起動するとこのメソッドが呼ばれる
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        print("Launch By Shortcut!!")

        print(shortcutItem.type)
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        if shortcutItem.type == "next" {
            let vc = storyBoard.instantiateViewControllerWithIdentifier("NextViewControllerID")
            window!.rootViewController?.presentViewController(vc, animated: true, completion: nil)
        } else if shortcutItem.type == "initial" {
            let vc = storyBoard.instantiateViewControllerWithIdentifier("navVC")
            window!.rootViewController?.presentViewController(vc, animated: true, completion: nil)
        }

        // ショートカットからの起動が成功したかを渡す
        completionHandler(true)
    }
}

