//
//  UniversityViewController.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import UIKit
import PKHUD


class UniversityViewController: UIViewController {

    @IBOutlet weak var tblListing: UITableView!

    
    var presenter : UniversityListPresenterProtocol?
    var model : [UniversityModel]?

    

    //  MARK: - ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    
    //  MARK: - SetupView Methods
    func setupView() {
        navigationItem.title = "University List"
        setupCell()
    }

    func setupCell() {
        tblListing.delegate = self
        tblListing.dataSource = self
        tblListing.register(UINib(nibName: "ListingViewCell", bundle: nil), forCellReuseIdentifier: "ListingViewCell")
    }


}


//  MARK: - UITableView Methods
extension UniversityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingViewCell", for: indexPath) as! ListingViewCell
        
        let model = model?[indexPath.row] ?? UniversityModel()
        cell.setupData(listing: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = model?[indexPath.row] ?? UniversityModel()
        presenter?.showUniversityDetail(forPost: model)
    }
}


//  MARK: - Protocol Methods
extension UniversityViewController: UniversityListViewProtocol {
    
    func showGets(with postModel: [UniversityModel]) {
        model = postModel
        tblListing.reloadData()
    }

    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}
