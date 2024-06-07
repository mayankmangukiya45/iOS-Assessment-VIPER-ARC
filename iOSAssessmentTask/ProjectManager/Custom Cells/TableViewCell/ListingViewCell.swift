//
//  ListingViewCell.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import UIKit

class ListingViewCell: UITableViewCell {
    
    @IBOutlet weak var lblUniversityName: UILabel!
    @IBOutlet weak var lblUniversityState: UILabel!
    
    @IBOutlet weak var btnRight: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblUniversityName.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lblUniversityState.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        btnRight.layer.masksToBounds = true
        btnRight.clipsToBounds = false
        btnRight.layer.cornerRadius = btnRight.frame.width/2
        btnRight.layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        btnRight.layer.shadowOffset = CGSize(width: 0, height: 0)
        btnRight.layer.shadowOpacity = 0.9
        btnRight.layer.shadowRadius = 3.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //  MARK: - Setup Datas
    func setupData(listing: UniversityModel) {
        lblUniversityName.text = listing.name ?? ""
        lblUniversityState.text = listing.stateProvince ?? ""
    }

}
