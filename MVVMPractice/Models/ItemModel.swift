//
//  PropertiesModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/10/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation

struct Item: Codable {
    let id: Int?
    let header: String?
    let longDescription: String?
    private let _images: [String?]?
    
    var images: [String] {
        if let images = _images {
            return images.compactMap({ $0 })
        }
        return []
    }
    
    var isNoImages: Bool {
        return images.count == 0
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case header
        case longDescription
        case _images         = "images"
    }
}
