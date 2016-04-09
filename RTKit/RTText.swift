//
//  RTText.swift
//  RTKit
//
//  Created by Rex Tsao on 9/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation

class RTText {
    
    /// Make the phone number to be asterisk. This will turn the numbers which start with
    /// the third to the six to be asterisk.
    class func blurPhone(phone: String) -> String {
        let chars = phone.cStringUsingEncoding(NSUTF8StringEncoding)
        var res = ""
        for i in 0 ..< chars!.count {
            var tmp = String(chars![i])
            if i >= 3 && i <= 6 {
                tmp = "*"
            }
            res += tmp
        }
        return res
    }
}