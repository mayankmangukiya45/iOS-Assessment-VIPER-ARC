//
//  RealmUniversityList.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import RealmSwift


class RealmUniversityList: Object {
    
    @objc dynamic var alphaTwoCode: String = ""
    var domains = List<String>()
    @objc dynamic var name: String = ""
    var webPages = List<String>()
    @objc dynamic var country: String = ""
    @objc dynamic var stateProvince: String = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }

    static func create(list: UniversityModel?) -> RealmUniversityList? {
        guard let list = list else { return nil }
        let universityList = RealmUniversityList()
        universityList.alphaTwoCode = list.alphaTwoCode ?? ""
        universityList.domains.append(objectsIn: list.domains)
        universityList.name = list.name ?? ""
        universityList.webPages.append(objectsIn: list.webPages)
        universityList.country = list.country ?? ""
        universityList.stateProvince = list.stateProvince ?? ""
        return universityList
    }

}
