//
//  UniversityPresenter.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation


class UniversityPresenter: UniversityListPresenterProtocol {
    
    var view: UniversityListViewProtocol?
    var interactor: UniversityListInteractorInputProtocol?
    var wireFrame: UniversityListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveUniversityList()
    }
    
    func showUniversityDetail(forPost post: UniversityModel) {
        wireFrame?.presentGetDetailScreen(from: view!, forPost: post)
    }
}

extension UniversityPresenter: UniversityListInteractorOutputProtocol {
    
    func didRetrieveUniversities(_ posts: [UniversityModel]) {
        view?.hideLoading()
        view?.showGets(with: posts)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
