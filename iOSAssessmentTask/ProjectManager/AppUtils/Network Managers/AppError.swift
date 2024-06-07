//
//  AppError.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import UIKit
import Alamofire


enum AppError: LocalizedError {
    case unknownError
    case networkError(status: Int, description: String)
    case dataError(description: String)

    var localizedDescription: String {
        switch self {
        case .unknownError:
            return "Unknown Error has Occurred"
        case .networkError(status: let status, description: let desc):
            return "\(status): \(desc)"
        case .dataError(description: let desc):
            return desc
        }
    }
}
