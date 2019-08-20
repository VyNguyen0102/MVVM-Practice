//
//  UILabelExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/23/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

// Font
extension Styleable where Base: UILabel {
    
    @discardableResult
    public func font(_ font: UIFont) -> Styleable<Base> {
        self.base.font = font
        return self
    }
    
    // REGULAR
    
    @discardableResult
    public func regular(_ size: CGFloat) -> Styleable<Base> {
        return self.font(UIFont.regularCustomFont(ofSize: size))
    }
    
    @discardableResult
    public func smallRegular() -> Styleable<Base> {
        return self.regular(12)
    }

    @discardableResult
    public func mediumRegular() -> Styleable<Base> {
        return self.regular(15)
    }

    @discardableResult
    public func largeRegular() -> Styleable<Base> {
        return self.bold(17)
    }

    // BOLD
    
    @discardableResult
    public func bold(_ size: CGFloat) -> Styleable<Base> {
        return self.font(UIFont.boldCustomFont(ofSize: size))
    }
    
    @discardableResult
    public func smallBold() -> Styleable<Base> {
        return self.bold(12)
    }
    
    @discardableResult
    public func mediumBold() -> Styleable<Base> {
        return self.bold(15)
    }
    
    @discardableResult
    public func largeBold() -> Styleable<Base> {
        return self.bold(17)
    }
}

// Color
extension Styleable where Base: UILabel {
    
    @discardableResult
    public func color(_ color: UIColor) -> Styleable<Base> {
        self.base.textColor = color
        return self
    }
    
    @discardableResult
    public func lightGray() -> Styleable<Base> {
        return color(.appLightGray)
    }
    
    @discardableResult
    public func darkGray() -> Styleable<Base> {
        return color(.appDarkGray)
    }
    
    @discardableResult
    public func black() -> Styleable<Base> {
        return color(.appTextBlack)
    }
    
    @discardableResult
    public func green() -> Styleable<Base> {
        return color(.appGreen)
    }
    
    @discardableResult
    public func red() -> Styleable<Base> {
        return color(.appRed)
    }
}

// Text
extension Styleable where Base: UILabel {
    @discardableResult
    public func localized(text: String) -> Styleable<Base> {
        self.base.text = text
        return self
    }
}
