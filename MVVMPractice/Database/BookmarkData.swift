//
//  BookmarkData.swift
//  NVGTest
//
//  Created by iOS Dev on 7/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import Realm

class BookmarkData: Database {
    func getBookmarkList() -> [Int] {
        let resurt: DatabaseResult<BookmarkModel> = getObjectList()
        switch resurt {
        case .success(let model):
            return model.map({$0.id})
        case .failure(_):
            return []
        }
    }
    
    func removeBookMarkDatabase(id: Int?) {
        removeObjectByID(BookmarkModel.self, id: id)
    }
    
    func addBookmarkDatabase(id: Int?) {
        guard let id = id else {
            return
        }
        let bookmark = BookmarkModel()
        bookmark.id = id
        addObject(object: bookmark)
    }
}
