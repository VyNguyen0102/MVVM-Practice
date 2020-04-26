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
    case newPassword
    
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
        case .newPassword:
            return "New Password"
        }
    }
    
    var isSecureTextEntry: Bool {
        switch self {
        case .password, .newPassword:
            return true
        default:
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
        case .firstName, .email, .password, .newPassword:
            return true
        default:
            return false
        }
    }

    var icon: UIImage? {
        switch self {
        case .email:
            return #imageLiteral(resourceName: "text-field-mail")
        case .password:
            return #imageLiteral(resourceName: "text-field-pass")
        default:
            return nil
        }
    }

    var isShowValid: Bool {
        switch self {
        case .email:
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
    case notValidPassword(passwordCheckResult: PasswordRequirement)
    case customError(localized: String)
    
    var localized: String {
        switch self {
        case .none:
            return ""
        case .empty:
            return "this field is required"
        case .notValidEmail:
            return "Not a valid email"
        case .notValidPassword(let passwordCheckResult):
            return passwordCheckResult.errorMessage
        case .customError(let localized):
            return localized
        }
    }
}
