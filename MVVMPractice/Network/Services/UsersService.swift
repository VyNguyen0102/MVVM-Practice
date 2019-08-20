//
//  UsersService.swift
//  NVGTest
//
//  Created by iOS Dev on 7/19/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import Moya

class UsersService: WebService {
    func getUsers(page: Int, completion: @escaping ((RequestResult<User>) -> Void)) {
        request(withTarget: ServiceTarget.getUsers( perPage: 25, page: page), progress: nil) { (result: RequestResult<UsersModel>, response) in
            switch result {
            case .success(let model):
                completion(.success(model: model.first?.data ?? []))
            case .failure(let error):
                completion(.failure(error: error))
            }
        }
    }
}
