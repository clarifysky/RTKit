//
//  RTWindow.swift
//  RTKit
//
//  Created by Rex Tsao on 10/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation

class RTTopWindow: UIWindow {
    
    init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.hidden = false
        self.windowLevel = UIWindowLevelAlert
        self.backgroundColor = nil
        self.rootViewController = UIViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func revoke() {
        self.windowLevel = UIWindowLevelAlert - 1
        self.removeFromSuperview()
    }
}
