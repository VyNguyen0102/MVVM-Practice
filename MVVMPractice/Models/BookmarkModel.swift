//
//  BookmarkModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/12/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RealmSwift

class BookmarkModel: Object {
    @objc dynamic var id = -1
    override static func primaryKey() -> String? {
        return "id"
    }
}
