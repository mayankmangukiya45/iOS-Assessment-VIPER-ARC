//
//  LocalStoredUniversityProvider.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 07-06-2024.
//

import Foundation
import RealmSwift

class LocalStoredUniversityProvider {
    
    //MARK: - Save
    func save(universities: [UniversityModel]) {
        deleteAll()
        universities.forEach { (university) in
            RealmUniversityList.create(list: university)?.add()
        }
    }

    
    //MARK: - delete
    func deleteAll() {
        do {
            let realm = try Realm()
            try! realm.write {
                realm.deleteAll()
            }
        } catch let error {
            print("Error opening Realm: \(error.localizedDescription)")
        }
    }

    
    //MARK: - Get
    func getAllLocalUniversities() -> [UniversityModel]? {
        let realm = try! Realm()
        var arrUniversityModel = [UniversityModel]()
        
        let universities = realm.objects(RealmUniversityList.self)
        
        for university in universities {
            var universityModel = UniversityModel()
            universityModel.alphaTwoCode = university.alphaTwoCode
            
            for domain in university.domains {
                universityModel.domains.append(domain)
            }
            
            universityModel.name = university.name
            
            for page in university.webPages {
                universityModel.webPages.append(page)
            }

            universityModel.country = university.country
            universityModel.stateProvince = university.stateProvince

            arrUniversityModel.append(universityModel)
        }

        return arrUniversityModel
    }

}
