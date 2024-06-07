//
//  RemoteDataManager.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import Alamofire


class UniversityListRemoteDataManager: UniversityListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: UniversityListRemoteDataManagerOutputProtocol?
    let network: NetworkProtocol

    let cachedUniversityProvider = LocalStoredUniversityProvider()
    var universities = [UniversityModel]()

    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func retrieveUniversityList() {
        network.request(req: Endpoint()) { (result) in
            switch result {
            case .success(let response):
                var datas = response
                print("store success\(datas)")
                if datas.count > 0 {
                    self.saveDataToLocalDB(datas)
                } else {
                    datas = self.cachedUniversityProvider.getAllLocalUniversities() ?? []
                }
                self.getLocalUniversityList()
                self.remoteRequestHandler?.onUniversitiesRetrieved(datas)
        
            case .failure(_):
                let university = self.cachedUniversityProvider.getAllLocalUniversities() ?? []
                if university.count > 0 {
                    self.getLocalUniversityList()
                } else {
                    self.remoteRequestHandler?.onError()
                }
            }
        }
    }
    
    func saveDataToLocalDB(_ universities: [UniversityModel]) {
        cachedUniversityProvider.save(universities: universities)
    }

    func getLocalUniversityList() {
        self.universities = cachedUniversityProvider.getAllLocalUniversities() ?? []
        print("cached universities ==> \(self.universities)")
        self.remoteRequestHandler?.onUniversitiesRetrieved(self.universities)
    }

}



struct Endpoint: Requestable {
        
    typealias ResponseType = [UniversityModel]
    
    var baseUrl: URL {
        return URL(string: "http://universities.hipolabs.com/")!
    }
    
    var endpoint: String {
        return "search"
    }
    
    var parameters: [String: Any] { return ["country": "United Arab Emirates"] }
    
    var method: Network.Method {
        return .get
    }
}
