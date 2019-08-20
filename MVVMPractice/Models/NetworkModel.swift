//
//  NetworkSupportModel.swift
//  NVGTest
//
//  Created by Vy Nguyen on 7/14/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import Moya

enum RequestResult<T> {
    /// The status code is from 200 to 299. If the parsing is successful, the model should be not nil.
    case success(model: [T])
    /// The other cases, such as no internet connection, the status code means un-success, or the timeout, ...
    case failure(error: WebServiceError)
}

enum WebServiceError { // handle network and authentication error only
    case authenticationError(message: String?)
    case networkDown
    case emptyResponse
    case httpError(errorCode: Int)
    case moyaError(error: MoyaError)
    
    var localizedDescription: String {
        switch self {
        case .authenticationError(let message):
            if let message = message {
                return message
            }
            return "authentication Error"
        case .networkDown:
            return "network Down"
        case .emptyResponse:
            return "empty Response"
        case .httpError(let errorCode):
            return "httpError \(errorCode)"
        case .moyaError(let error):
            return error.errorDescription ?? "error"
        }
    }
}

struct CancellableRequest {
    var id: String
    var cancellable: Cancellable?
}
