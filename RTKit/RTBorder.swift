//
//  RTBorder.swift
//  RTKit
//
//  Created by Rex Tsao on 29/4/2016.
//  Copyright © 2016 rexcao.net. All rights reserved.
//

import Foundation
import UIKit

public enum AttachedBorder {
    case Top
    case Left
    case Bottom
    case Right
}

public class RTBorder {
    public var side: AttachedBorder
    public var borderWidth: CGFloat
    public var borderColor: UIColor
    
    public init(side: AttachedBorder, borderWidth: CGFloat, borderColor: UIColor) {
        self.side = side
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
}