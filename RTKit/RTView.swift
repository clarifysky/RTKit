//
//  RTView.swift
//  RTKit
//
//  Created by Rex Tsao on 9/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation

class RTView {
    
    class func viewController(storyboardName: String, storyboardID: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier(storyboardID)
    }
    
    class Pop: UIView {
        
        lazy var messageLabel = UILabel()
        private var timer: NSTimer?
        var ticking: Bool = true {
            willSet {
                self.whetherTick(newValue)
            }
        }
        
        init(frame: CGRect, message: String?, ticked: Bool = true) {
            super.init(frame: frame)
            self.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
            self.layer.cornerRadius = 10
            
            self.messageLabel.numberOfLines = 0
            self.messageLabel.text = message
            self.messageLabel.textColor = UIColor.whiteColor()
            self.messageLabel.textAlignment = .Center
            self.messageLabel.backgroundColor = UIColor.clearColor()
            let properSize = self.messageLabel.sizeThatFits(CGSizeMake(3 * frame.width / 4, frame.height))
            
            let labelOrigin = RTMath.centerOrigin(frame.size, childSize: properSize)
            self.messageLabel.frame = CGRectMake(labelOrigin.x, labelOrigin.y, properSize.width, properSize.height)
            self.addSubview(self.messageLabel)
            
            self.whetherTick(ticked)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func whetherTick(ticked: Bool) {
            if ticked {
                self.timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1), target: self, selector: #selector(self.tick), userInfo: nil, repeats: true)
            } else {
                self.timer?.invalidate()
                self.timer = nil
            }
        }
        
        func tick() {
            self.timer?.invalidate()
            self.removeFromSuperview()
        }
    }

}