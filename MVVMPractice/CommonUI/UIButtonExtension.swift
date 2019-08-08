//
//  UIButtonExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/30/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UIButton {
    func setupDefaultStyle(withTitle localize: String? = nil) {
        self.contentEdgeInsets = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        self.backgroundColor = UIColor.appGreen
        self.setBackgroundImage(UIImage.from(color: UIColor.appLightGray), for: .disabled)
        self.setTitleColor(UIColor.appTextWhite, for: UIControl.State.normal)
        if let localize = localize {
            self.setTitle(localize, for: .normal)
        }
    }
}
