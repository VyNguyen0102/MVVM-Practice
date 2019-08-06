//
//  ErrorMessageModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

struct ErrorMessageModel: Codable {
    let message: String
    enum CodingKeys: String, CodingKey {
        case message                 = "message"
    }
}
