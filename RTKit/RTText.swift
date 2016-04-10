//
//  RTText.swift
//  RTKit
//
//  Created by Rex Tsao on 9/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation

public class RTText {
    
    /// Make the phone number to be asterisk. This will turn the numbers which start with
    /// the third to the six to be asterisk.
    public class func blurPhone(phone: String) -> String {
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
    
    public class func encodeUrl(url: String) -> String {
        let customAllowedSet = NSCharacterSet(charactersInString: "#%<>@\\^`{|}").invertedSet
        return url.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)!
    }
    
    public class func decodeUrl(url: String) -> String {
        return url.stringByRemovingPercentEncoding!
    }
}

public extension NSRange {
    /// Make String in swift can use stringByReplacingCharactersInRange
    public func toRange(string: String) -> Range<String.Index> {
        let startIndex = string.startIndex.advancedBy(self.location)
        let endIndex = startIndex.advancedBy(self.length)
        return startIndex..<endIndex
    }
}