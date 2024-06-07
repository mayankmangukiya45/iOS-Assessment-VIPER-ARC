//
//  NetworkProtocol.swift
//  iOSAssessmentTask
//
//  Created by MacbookPro on 06-06-2024.
//

import Foundation
import Alamofire


protocol NetworkProtocol {
    func request<T: Requestable>(req: T, completionHandler: @escaping (Result<T.ResponseType>) -> Void)
}
