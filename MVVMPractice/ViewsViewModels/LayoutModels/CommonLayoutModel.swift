//
//  CommonLayoutModel.swift
//  NVGTest
//
//  Created by iOS Dev on 8/1/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit


enum InputType {
    case firstName
    case lastName
    case email
    case universityName
    case password
    
    var placeholder: String {
        switch self {
        case .firstName:
            return "First Name"
        case .lastName:
            return "Last Name"
        case .email:
            return "Email"
        case .universityName:
            return "University Name"
        case .password:
            return "Password"
        }
    }
    
    var isSecureTextEntry: Bool {
        if case .password = self {
            return true
        } else {
            return false
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .firstName:
            return .namePhonePad
        case .lastName:
            return .namePhonePad
        case .email:
            return .emailAddress
        default:
            return .default
        }
    }
    
    var isMadatory: Bool {
        switch self {
        case .firstName, .email, .password:
            return true
        default:
            return false
        }
    }
}

enum TextFieldError {
    case none
    case empty
    case notValidEmail
    case customError(localized: String)
    
    var localized: String {
        switch self {
        case .none:
            return ""
        case .empty:
            return "this field is required"
        case .notValidEmail:
            return "Not a valid email"
        case .customError(let localized):
            return localized
        }
    }
}
