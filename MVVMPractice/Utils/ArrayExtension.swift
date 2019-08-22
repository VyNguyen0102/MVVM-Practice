//
//  ArrayExtension.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

extension Optional where Wrapped == Array<Any> {
    var isEmpty: Bool {
        guard let wrapped = self else {
            return true
        }
        return wrapped.count == 0
    }
}
