//
//  DatabaseModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RealmSwift

enum DatabaseResult<T: Object> {
    case success(model: [T])
    case failure(error: DatabaseError)
}

enum DatabaseError { // handle network and authentication error only
    case realmError
    var description: String {
        switch self {
        case .realmError:
            return "Fail to connect database"
        }
    }
}
