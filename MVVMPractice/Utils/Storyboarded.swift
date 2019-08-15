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
        let viewControllerIdentifier = T.string // Reduce leak memory 
        return instantiateViewController(withIdentifier: viewControllerIdentifier) as! T
    }
}
