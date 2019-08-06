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
    
    static let numberItemPerPage = 25
    
    static let imageLoadOptions = ImageLoadingOptions(
        placeholder: #imageLiteral(resourceName: "loading"),
        transition: .fadeIn(duration: 0.33),
        failureImage: #imageLiteral(resourceName: "load_error")
    )

    static let loadMoreOffset: Int = 3
}
