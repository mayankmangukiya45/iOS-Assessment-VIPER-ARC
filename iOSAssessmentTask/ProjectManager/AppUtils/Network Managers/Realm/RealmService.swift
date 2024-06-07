//
//  RealmService.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import UIKit
import RealmSwift


class RealmService<T>: RealmServiceProtocol where T: RealmEntity, T: Object, T.EntityType: Entity {
    
    typealias RealmEntityType = T

    private let realm = try! Realm()
    
    func save(items: [T.EntityType]) throws {
        try realm.write {
            items.forEach {
                realm.add($0.realmObject as! T, update: .all)
            }
        }
    }

    func update(block: @escaping () -> ()) throws {
        try realm.write() {
            block()
        }
    }

    func fetchAll() -> [T.EntityType] {
        return realm.objects(T.self).compactMap {
            $0.entityObject
        }
    }
}
