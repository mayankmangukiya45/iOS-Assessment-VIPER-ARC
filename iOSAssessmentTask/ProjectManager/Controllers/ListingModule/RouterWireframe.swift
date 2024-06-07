//
//  RouterWireframe.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import UIKit


class GetListWireFrame: UniversityListWireFrameProtocol {
    
    static func createGetListModule() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navController = storyBoard.instantiateViewController(withIdentifier: "NavigationController")
        if let view = navController.children.first as? UniversityViewController {
            let presenter: UniversityListPresenterProtocol & UniversityListInteractorOutputProtocol = UniversityPresenter()
            let interactor: UniversityListInteractorInputProtocol & UniversityListRemoteDataManagerOutputProtocol = UniversityInteractor()
            let remoteDataManager: UniversityListRemoteDataManagerInputProtocol = UniversityListRemoteDataManager()
            let wireFrame: UniversityListWireFrameProtocol = GetListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    func presentGetDetailScreen(from view: UniversityListViewProtocol, forPost post: UniversityModel) {
        let universityDetailViewController = UniversityDetailWireFrame.createUniversityDetailModule(forPost: post)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(universityDetailViewController, animated: true)
        }
    }
    
}

