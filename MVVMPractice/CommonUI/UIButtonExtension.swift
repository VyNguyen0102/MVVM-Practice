//
//  UIButtonExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/30/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

// Font
extension Styleable where Base: UIButton {
    @discardableResult
    public func normal() -> Styleable<Base> {
        self.base.contentEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        self.base.backgroundColor = UIColor.appGreen
        self.base.titleLabel?.font = .boldCustomFont(ofSize: 15)
        self.base.setBackgroundImage(UIImage.from(color: UIColor.appLightGray), for: .disabled)
        self.base.setTitleColor(UIColor.appTextWhite, for: UIControl.State.normal)
        return self
    }
    public func round() -> Styleable<Base> {
        self.base.titleLabel?.font = .boldCustomFont(ofSize: 15)
        self.base.setTitleColor(UIColor.appTextWhite, for: UIControl.State.normal)
        self.base.clipsToBounds = true
        self.base.cornerRadius = self.base.frame.height / 2
        return self
    }
    public func orangeWhite() -> Styleable<Base> {
        self.base.backgroundColor = UIColor.buttonOrage
        self.base.setBackgroundImage(UIImage.from(color: UIColor.appLightGray), for: .disabled)
        self.base.setTitleColor(UIColor.appTextWhite, for: UIControl.State.normal)
        self.base.borderWidth = 1
        self.base.borderColor = UIColor.buttonWhite
        return self
    }
    public func whiteOrange() -> Styleable<Base> {
        self.base.backgroundColor = UIColor.buttonWhite
        self.base.setTitleColor(UIColor.buttonOrage, for: UIControl.State.normal)
        self.base.setTitleColor(UIColor.appTextGray, for: UIControl.State.disabled)
        self.base.borderWidth = 1
        self.base.borderColor = UIColor.buttonOrage
        return self
    }
}

// Text
extension Styleable where Base: UIButton {
    @discardableResult
    public func localized(text: String) -> Styleable<Base> {
        self.base.setTitle(text, for: .normal)
        return self
    }
}
