//
//  StyleableExtension.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

public struct Styleable<Base> {
    /// Base object to extend.
    public let base: Base
    
    /// Creates extensions with base object.
    ///
    /// - parameter base: Base object.
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol StyleCompatible {
}

extension StyleCompatible {
    
    /// Style extensions.
    private(set) var style: Styleable<Self> {
        get {
            return Styleable(self)
        }
        set {
            fatalError("You cannot write from this object.")
        }
    }
}

extension UIView: StyleCompatible {
}
