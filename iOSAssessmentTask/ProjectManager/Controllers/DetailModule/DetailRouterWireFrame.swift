//
//  DetailRouterWireFrame.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import UIKit


class UniversityDetailWireFrame: UniversityDetailWireFrameProtocol {
    
    class func createUniversityDetailModule(forPost post: UniversityModel) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "UniversityDetailViewController")
        if let view = viewController as? UniversityDetailViewController {
            
            let presenter: UniversityDetailPresenterProtocol = UniversityDetailPresenter()
            let wireFrame: UniversityDetailWireFrameProtocol = UniversityDetailWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.post = post
            presenter.wireFrame = wireFrame

            return viewController
        }
        return UIViewController()
    }
        
}
