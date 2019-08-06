//
//  StringExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 8/1/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
