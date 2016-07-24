//
//  SideMenuManager.swift
//  TemplateApp
//
//  Created by Pawan Kumar on 13/04/16.
//  Copyright © 2016 Modi. All rights reserved.
//

import UIKit
import MMDrawerController

/// Side Menu manager to provide sibgle instanse om side manager
class SideMenuManager: NSObject {
    
    // MARK: - Singleton Instance
    private static let _sharedManager = SideMenuManager()
    
    var container: MMDrawerController? = MMDrawerController()
    var center: UIViewController {
        get {
            if container!.centerViewController.isKindOfClass(UINavigationController) {
                return (container!.centerViewController as! UINavigationController).viewControllers.first!
            }
            return container!.centerViewController
        }
    }
    private override init() {
        super.init()
    }
    
    /**
     Set container properties.
     
     - parameter block: drawer object
     */
    func setValues(block: (MMDrawerController)->()) {
        assert(container != nil, "Container(Drawer) must be set")
        block(container!)
    }
    
    // MARK: - Singleton Method
    class func sharedManager() -> SideMenuManager {
        if _sharedManager.container == nil {
            _sharedManager.container = MMDrawerController()
        }
        return _sharedManager
    }
}
