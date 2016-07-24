//
//  AppDelegate.swift
//  vCardReader
//
//  Created by Pawan Kumar on 24/07/16.
//  Copyright © 2016 Pawan Kumar. All rights reserved.
//

import UIKit
import MMDrawerController
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        AppDelegate.delegate().window?.rootViewController = AppDelegate.rootViewController()
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

    
    
    extension AppDelegate {
        
        // MARK: - App Delegate Ref
        class func delegate() -> AppDelegate {
            return UIApplication.sharedApplication().delegate as! AppDelegate
        }
        
        func switchAppToStoryboard(name: String, storyboardId: String) {
            let storyboard = UIStoryboard(name: name, bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewControllerWithIdentifier(storyboardId)
        }
        
        class func rootViewController() -> UIViewController! {
            
            if (1 == 1) {//UserManager.sharedManager().isUserLoggedIn()
                let storyboard = UIStoryboard.mainStoryboard()
                let leftDrawer = storyboard.instantiateViewControllerWithIdentifier("LeftMenuViewController")
                let center = storyboard.instantiateViewControllerWithIdentifier("HomeMenuContainer")
                
                let menuManager = SideMenuManager.sharedManager()
                menuManager.setValues { (drawer: MMDrawerController) -> () in
                    drawer.leftDrawerViewController = leftDrawer
                    drawer.centerViewController = center
                    drawer.openDrawerGestureModeMask = .All
                    drawer.closeDrawerGestureModeMask = .All
                    //drawer.setDrawerVisualStateBlock(MMDrawerVisualState.slideAndScaleVisualStateBlock())
                }
                return SideMenuManager.sharedManager().container!
                
            }
            else {
                // CHange Here for Sign Up
                let storyboard = UIStoryboard.signUpStoryboard()
                var  navController = storyboard.instantiateInitialViewController() as! UINavigationController
                return navController
            }
        }
        
        private func enableInputAccessoryView() {
            IQKeyboardManager.sharedManager().enable = true
            IQKeyboardManager.sharedManager().toolbarTintColor = UIColor.orangeColor()
            IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = false
            IQKeyboardManager.sharedManager().enableAutoToolbar = true
        }
        
        private func setupLogger() {
            #if DEBUG
                LogManager.setup(.Debug)
            #else
                // LogManager.setup(.Error)
            #endif
        }
        
        
    }


