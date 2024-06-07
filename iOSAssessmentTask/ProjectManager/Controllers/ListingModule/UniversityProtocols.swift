//
//  UniversityProtocols.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import UIKit

protocol UniversityListViewProtocol: AnyObject {
    var presenter: UniversityListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showGets(with gets: [UniversityModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol UniversityListWireFrameProtocol: AnyObject {
    static func createGetListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentGetDetailScreen(from view: UniversityListViewProtocol, forPost post: UniversityModel)
}

protocol UniversityListPresenterProtocol: AnyObject {
    var view: UniversityListViewProtocol? { get set }
    var interactor: UniversityListInteractorInputProtocol? { get set }
    var wireFrame: UniversityListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showUniversityDetail(forPost post: UniversityModel)
}

protocol UniversityListInteractorInputProtocol: AnyObject {
    var presenter: UniversityListInteractorOutputProtocol? { get set }
    var remoteDatamanager: UniversityListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveUniversityList()
}

protocol UniversityListInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func didRetrieveUniversities(_ universities: [UniversityModel])
    func onError()
}

protocol UniversityListRemoteDataManagerInputProtocol: AnyObject {
    var remoteRequestHandler: UniversityListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveUniversityList()
}

protocol UniversityListRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onUniversitiesRetrieved(_ universities: [UniversityModel])
    func onError()
}

