//
//  Storyboarded.swift
//  NVGTest
//
//  Created by iOS Dev on 7/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
    static var storyboardName: String { get }
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        
        let className = Self.string
        
        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
