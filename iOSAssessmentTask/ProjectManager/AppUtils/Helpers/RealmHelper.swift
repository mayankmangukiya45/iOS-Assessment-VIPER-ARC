//
//  RealmHelper.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 07-06-2024.
//

import UIKit
import RealmSwift

typealias UpdateRealmBlock = (_ realm: Realm) -> ()

extension Realm {
    static func write(updateBlock: UpdateRealmBlock) {
        Realm.block { (realm) in
            do {
                try realm.write { updateBlock(realm) }
            } catch { print("Cant write with realm", error) }
        }
    }
    
    static func block(updateBlock: UpdateRealmBlock) {
        do {
            let realm = try Realm()
            updateBlock(realm)
        } catch { print("Cant init realm object", error) }
    }
}

extension Object {
    func add() {
        Realm.write { realm in
            realm.add(self)
        }
    }
}
