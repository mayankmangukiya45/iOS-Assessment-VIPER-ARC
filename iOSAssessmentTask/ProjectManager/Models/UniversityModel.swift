//
//  UniversityModel.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation

struct UniversityModel: Codable {
    
    var alphaTwoCode: String?
    var domains: [String] = [""]
    var name: String?
    var webPages: [String] = [""]
    var country: String?
    var stateProvince: String?

    enum CodingKeys: String, CodingKey {
        case alphaTwoCode = "alpha_two_code"
        case domains = "domains"
        case name = "name"
        case webPages = "web_pages"
        case country = "country"
        case stateProvince = "state-province"
    }

}
