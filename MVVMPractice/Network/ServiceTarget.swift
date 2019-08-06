//
//  ServiceTarget.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Moya

enum ServiceTarget {
    case getUsers(perPage: Int, page: Int)
}

extension ServiceTarget: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var method: Method {
        switch self {
        case .getUsers(_, _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUsers(let perPage,let page):
            var parameters = [String: Any]()
            parameters["per_page"] = perPage
            parameters["page"] = page
            parameters["delay"] = 3
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return Configuration.API.headerParams
    }
    
    var environmentBaseURL: String {
        return Configuration.API.apiUrl
    }
    
    var baseURL: URL {
        guard let url = URL.init(string: environmentBaseURL) else {
            fatalError("not a valid url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getUsers(_ ,_):
            return "users"
        }
    }
}

extension ServiceTarget {
    var timeOut: TimeInterval {
        return 60
    }
}
