//
//  UILabelExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/23/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

enum LabelStyle {
    case viewControllerHeader
    case largeHeaderText
    case largeText
    case smallHeaderText
    case smallText
    case errorMessageText
    case undefined
    
    var font: UIFont {
        switch self {
        case .viewControllerHeader:
            return UIFont.boldCustomFont(ofSize: 17)
        case .largeHeaderText:
            return UIFont.boldCustomFont(ofSize: 15)
        case .largeText:
            return UIFont.boldCustomFont(ofSize: 15)
        case .smallHeaderText:
            return UIFont.regularCustomFont(ofSize: 13)
        case .smallText:
            return UIFont.regularCustomFont(ofSize: 13)
        case .errorMessageText:
            return UIFont.regularCustomFont(ofSize: 13)
        case .undefined:
            return UIFont.boldCustomFont(ofSize: 15)
        
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .viewControllerHeader:
            return UIColor.appTextWhite
        case .largeHeaderText:
            return UIColor.appDarkGray
        case .largeText:
            return UIColor.appTextBlack
        case .smallHeaderText:
            return UIColor.appTextGray
        case .smallText:
            return UIColor.appTextGray
        case .errorMessageText:
            return UIColor.appRed
        case .undefined:
            return UIColor.appTextBlack
        }
    }
}

extension UILabel {
    
    var style: LabelStyle {
        @available(*, unavailable)
        get {
            fatalError("You cannot read from this object.")
        }
        set {
            setupLabelStype(style: newValue)
        }
    }
    
    func setupLabelStype(style: LabelStyle) {
        textColor = style.textColor
        font = style.font
    }
}
