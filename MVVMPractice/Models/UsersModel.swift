//
//  UserModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/23/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RxRelay

struct User: Codable {
    var avatar: String?
    var email: String?
    var firstName: String?
    var id: Int?
    var lastName: String?
    let isFavorite: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    var name: String {
        return "\(firstName ?? "") \(lastName ?? "")"
    }
    
    enum CodingKeys: String, CodingKey {
        case avatar              = "avatar"
        case email               = "email"
        case firstName           = "first_name"
        case id                  = "id"
        case lastName            = "last_name"
    }
}

struct UsersModel: Codable {
    var data: [User]?
    var page: Int?
    var perPage: Int?
    var total: Int?
    var totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case data                = "data"
        case page                = "page"
        case perPage             = "per_page"
        case total               = "total"
        case totalPages          = "total_pages"
    }
}

