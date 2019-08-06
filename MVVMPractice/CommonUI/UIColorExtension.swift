//
//  UIColorExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/24/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UIColor {
    class var primaryColor: UIColor {
        return UIColor.appGreen
    }
    
    class var appTextBlack: UIColor {
        return #colorLiteral(red: 0.1096273437, green: 0.113439776, blue: 0.1300374269, alpha: 1)
    }
    
    class var appTextWhite: UIColor {
        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    class var appGreen: UIColor {
        return #colorLiteral(red: 0.4832904339, green: 0.7766446471, blue: 0.8195533156, alpha: 1)
    }
    
    class var appTextGray: UIColor {
        return #colorLiteral(red: 0.681815207, green: 0.6979247928, blue: 0.7103747725, alpha: 1)
    }
    
    class var appDarkGray: UIColor {
        return #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    class var appLightGray: UIColor {
        return UIColor.lightGray
    }
    
    class var appRed: UIColor {
        return UIColor.red
    }
}
