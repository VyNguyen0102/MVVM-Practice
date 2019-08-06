//
//  TableViewModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import RxRelay
import RealmSwift

class TableViewModel {
    
    let items: BehaviorRelay<[Item]> = BehaviorRelay<[Item]>(value: [])
    let bookmarkList: BehaviorRelay<[Int?]> = BehaviorRelay<[Int?]>(value: [])
    let errorMessage: PublishRelay<String> = PublishRelay<String>()
    
    let bookmarkData = BookmarkData()
    
    func loadData() {
        loadBookmarkList()
        loadProperties()
    }
    
    func loadBookmarkList() {
        let storedBookmarkList = bookmarkData.getBookmarkList()
        bookmarkList.accept(storedBookmarkList)
    }
    
    func loadProperties() {
        // read file and map to items list
        if let path = Bundle.main.path(forResource: "dummy", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let items = try JSONDecoder().decode([Item].self, from: data)
                self.items.accept(items)
            } catch {
                errorMessage.accept("Something went wrong")
            }
        }
    }
    
    func setBookmark(item: Item, isBookmark: Bool) {
        let id = item.id
        if isBookmark {
            bookmarkList.accept(bookmarkList.value + [id])
            bookmarkData.addBookmarkDatabase(id: id)
        } else {
            bookmarkList.accept(bookmarkList.value.filter({ $0 != id }))
            bookmarkData.removeBookMarkDatabase(id: id)
        }
    }

}
