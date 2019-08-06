//
//  UIFontExtension.swift
//  NVGTest
//
//  Created by Vy Nguyen on 7/14/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    /* HelveticaNeue family
     Font Family Name = [Titillium Web]
     Font Names = [["TitilliumWeb-Italic", "TitilliumWeb-BoldItalic", "TitilliumWeb-Regular", "TitilliumWeb-Bold"]]
     Font Family Name = [Titillium Web SemiBold]
     Font Names = [["TitilliumWeb-SemiBoldItalic", "TitilliumWeb-SemiBold"]]
     Font Family Name = [Titillium Web Black]
     Font Names = [["TitilliumWeb-Black"]]
     Font Family Name = [Titillium Web ExtraLight]
     Font Names = [["TitilliumWeb-ExtraLightItalic", "TitilliumWeb-ExtraLight"]]
     Font Family Name = [Titillium Web Light]
     Font Names = [["TitilliumWeb-Light", "TitilliumWeb-LightItalic"]]
     */
    class func ultraLightCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-ExtraLight", size: fontSize)!
    }
    class func thinCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Light", size: fontSize)!
    }
    class func lightCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Light", size: fontSize)!
    }
    class func regularCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Regular", size: fontSize)!
    }
    class func mediumCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Black", size: fontSize)!
    }
    class func semiboldCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-SemiBold", size: fontSize)!
    }
    class func boldCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Bold", size: fontSize)!
    }
    class func heavyCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Black", size: fontSize)!
    }
    class func blackCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Black", size: fontSize)!
    }
    class func italicCustomFont(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont.init(name: "TitilliumWeb-Italic", size: fontSize)!
    }
}
