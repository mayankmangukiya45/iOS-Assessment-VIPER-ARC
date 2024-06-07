//
//  DetailProtocol.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import UIKit

protocol UniversityDetailViewProtocol: AnyObject {
    var presenter: UniversityDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showUniversityDetail(forPost post: UniversityModel)
}

protocol UniversityDetailWireFrameProtocol: AnyObject {
    static func createUniversityDetailModule(forPost post: UniversityModel) -> UIViewController
}

protocol UniversityDetailPresenterProtocol: AnyObject {
    var view: UniversityDetailViewProtocol? { get set }
    var wireFrame: UniversityDetailWireFrameProtocol? { get set }
    var post: UniversityModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
