//
//  UniversityDetailViewController.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import UIKit

class UniversityDetailViewController: UIViewController {

    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!
    @IBOutlet weak var lblUniversityCountry: UILabel!
    @IBOutlet weak var lblUniversityCountryCode: UILabel!
    @IBOutlet weak var lblUniversityWebPage: UILabel!

    var presenter: UniversityDetailPresenterProtocol?

    //  MARK: - ViewController LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        lblUniversityName.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        lblUniversityState.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        lblUniversityCountry.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        lblUniversityCountryCode.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        lblUniversityWebPage.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        [lblUniversityName, lblUniversityState, lblUniversityCountry, lblUniversityCountryCode, lblUniversityWebPage].forEach({
            $0?.text = ""
        })
    }
    
    
    // MARK: - UIButton Action Methods
    
}


extension UniversityDetailViewController: UniversityDetailViewProtocol {
    
    func showUniversityDetail(forPost post: UniversityModel) {
        lblUniversityName.text = post.name ?? ""
       
        if post.stateProvince != nil {
            lblUniversityState.isHidden = false
            lblUniversityState.text = post.stateProvince ?? ""
        } else {
            lblUniversityState.isHidden = true
        }
                
        lblUniversityCountry.text = post.country ?? ""
        lblUniversityCountryCode.text = post.alphaTwoCode ?? ""
        
        if post.webPages.count > 0 {
            lblUniversityWebPage.text = post.webPages.first ?? ""
        }
    }
}
