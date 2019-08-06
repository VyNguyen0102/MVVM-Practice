//
//  NSObjectExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

extension NSObject {
    // Static Class using
    static var string: String {
        return String.init(describing: self)
    }
}

extension Optional where Wrapped == Int {
    func toString() -> String {
        guard let wrapped = self else {
            return ""
        }
        return String(wrapped)
    }
}
