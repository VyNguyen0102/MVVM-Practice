//
//  Storyboarded.swift
//  NVGTest
//
//  Created by iOS Dev on 7/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>() -> T {
        return instantiateViewController(withIdentifier: T.string) as! T
    }
}
