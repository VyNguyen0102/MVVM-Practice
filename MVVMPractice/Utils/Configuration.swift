//
//  Configuration.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import Nuke

enum Configuration {
    
    enum API {
        static let apiUrl: String = "https://reqres.in/api/"
        static let headerParams: [String : String]? = ["Accept" : "application/json; charset=utf-8",
                                                       "Accept-Language": "en"]
    }
    
    enum Password {
        static let specialCharSet: String = "$@$#!%*?&"
        static let validCharSet: String = String.init(format: "A-Za-z\\d%@" ,Password.specialCharSet)
        static let maxLength: Int = 10
        static let minLength: Int = 8
        // All characters that are valid
        static let validCharRegex: String = String.init(format: "^[%@]*$", Password.validCharSet)
        // Have at least 1 special character
        static let specialCharRegex: String = String.init(format: "^(?=.*[%@]).*$", Password.specialCharSet)
        // Have at least 1 lowercase character
        static let lowercaseCharRegex: String = "^(?=.*[a-z]).*$"
        // Have at least 1 upercase character
        static let uppercaseCharRegex: String = "^(?=.*[A-Z]).*$"
        // Have length in range
        static let lengthRegex: String = String.init(format: "^.{%d,%d}$", Password.minLength, Password.maxLength )
    }
    
    static let numberItemPerPage = 25
    
    static let imageLoadOptions = ImageLoadingOptions(
        placeholder: #imageLiteral(resourceName: "loading"),
        transition: .fadeIn(duration: 0.33),
        failureImage: #imageLiteral(resourceName: "load_error")
    )

    static let loadMoreOffset: Int = 3
}
