//
//  UIViewExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/10/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let borderColor = layer.borderColor{
                return  UIColor.init(cgColor: borderColor)
            }
            return nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

