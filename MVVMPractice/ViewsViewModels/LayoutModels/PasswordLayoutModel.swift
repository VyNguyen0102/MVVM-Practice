//
//  PasswordLayoutModel.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/7/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

// This on layout model because including error message localized
enum PasswordCheckResult {
    case allCharsMustBeValid
    case mustIncludeLowercase
    case mustIncludeUppercase
    case mustIncludeSpecialChar
    case lengthMustBeInRange
    case validPassword
    
    var regex: String {
        switch self {
        case .allCharsMustBeValid:
            return Configuration.Password.validCharRegex
        case .mustIncludeLowercase:
            return Configuration.Password.lowercaseCharRegex
        case .mustIncludeUppercase:
            return Configuration.Password.uppercaseCharRegex
        case .mustIncludeSpecialChar:
            return Configuration.Password.specialCharRegex
        case .lengthMustBeInRange:
            return Configuration.Password.lengthRegex
        case .validPassword:
            return ""
        }
    }

    var errorMessage: String {
        switch self {
        case .allCharsMustBeValid:
            return "All Characters Must Be Valid"
        case .mustIncludeLowercase:
            return "Must Include Lowercase"
        case .mustIncludeUppercase:
            return "Must Include Uppercase"
        case .mustIncludeSpecialChar:
            return "Must Include Special Character"
        case .lengthMustBeInRange:
            return "Length Must Be In Range"
        case .validPassword:
            return ""
        }
    }
}

extension PasswordCheckResult {
    static let allPasswordCheck: [PasswordCheckResult] = [.allCharsMustBeValid,
                                                          .mustIncludeLowercase,
                                                          .mustIncludeUppercase,
                                                          .mustIncludeSpecialChar,
                                                          .lengthMustBeInRange]
}

extension String {
    func isValidPassword() -> PasswordCheckResult {
        let REGEX_SELF_MATCHES = "SELF MATCHES %@"
        for passwordCheck in PasswordCheckResult.allPasswordCheck {
            if !NSPredicate(format: REGEX_SELF_MATCHES, passwordCheck.regex).evaluate(with: self) {
                return passwordCheck
            }
        }
        return .validPassword
    }
}
