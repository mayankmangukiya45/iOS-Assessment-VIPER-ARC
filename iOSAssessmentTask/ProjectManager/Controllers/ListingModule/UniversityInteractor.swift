//
//  UniversityInteractor.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation


class UniversityInteractor: UniversityListInteractorInputProtocol {
    
    var presenter: UniversityListInteractorOutputProtocol?
    var remoteDatamanager: UniversityListRemoteDataManagerInputProtocol?
    
    func retrieveUniversityList() {
        remoteDatamanager?.retrieveUniversityList()
    }
}

extension UniversityInteractor: UniversityListRemoteDataManagerOutputProtocol {
    
    func onUniversitiesRetrieved(_ universities: [UniversityModel]) {
        presenter?.didRetrieveUniversities(universities)
    }
    
    func onError() {
        presenter?.onError()
    }
}
