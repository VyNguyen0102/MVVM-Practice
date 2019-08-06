//
//  Database.swift
//  NVGTest
//
//  Created by iOS Dev on 7/12/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RealmSwift

public class Database {
    
    func getObjectList<T: Object>(filter: String? = nil) -> DatabaseResult<T> {
        do {
            let realm = try Realm()
            if let filter = filter {
                let objectsList: [T] = realm.objects(T.self).filter(filter).map({ $0.self })
                return DatabaseResult.success(model: objectsList)
            } else {
                let objectsList: [T] = realm.objects(T.self).map({ $0.self })
                return DatabaseResult.success(model: objectsList)
            }
        } catch {
            print("error connect database")
            return DatabaseResult.failure(error: .realmError)
        }
    }
    
    func removeObjectByID<Element: Object>(_ type: Element.Type, id: Int?) {
        guard let id = id, let primaryKey = Element.primaryKey() else {
            return
        }
        do {
            let realm = try Realm()
            if let bookmark = realm.objects(type).filter("\(primaryKey) == \(id)").first {
                try realm.write {
                    realm.delete(bookmark)
                }
            }
        } catch {
            print("error connect database")
        }
    }
    
    func addObject(object: Object) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print("error connect database")
        }
    }
}
