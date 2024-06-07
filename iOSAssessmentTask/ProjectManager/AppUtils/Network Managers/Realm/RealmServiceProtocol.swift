//
//  RealmServiceProtocol.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation



protocol RealmServiceProtocol: class {
    associatedtype EntityType

    func save(items: [EntityType]) throws
    func update(block: @escaping () -> ()) throws    
    func fetchAll() -> [EntityType]
}


protocol Entity {
    associatedtype RealmEntityType
    var realmObject: RealmEntityType { get }
}

protocol RealmEntity {
    associatedtype EntityType
    var entityObject: EntityType { get }
}
