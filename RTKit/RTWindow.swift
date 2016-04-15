//
//  RTWindow.swift
//  RTKit
//
//  Created by Rex Tsao on 10/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation
import UIKit

public class RTTopWindow: UIWindow {
    
    public init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.hidden = false
        self.windowLevel = UIWindowLevelAlert
        self.backgroundColor = nil
        self.rootViewController = UIViewController()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func revoke() {
        self.windowLevel = UIWindowLevelAlert - 1
        self.removeFromSuperview()
    }
}


public class RTWindow {
    
    public class func keyWindow() -> UIWindow? {
        return UIApplication.sharedApplication().keyWindow
    }
    
    public class func sharedTopWindow() -> RTTopWindow {
        var sharedTopWindow: RTTopWindow?
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken, {
            sharedTopWindow = RTTopWindow()
        })
        return sharedTopWindow!
    }
    
}