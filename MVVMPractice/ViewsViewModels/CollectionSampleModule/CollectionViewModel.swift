//
//  MainViewModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RxRelay
import Moya

class CollectionViewModel {
    
    let users: BehaviorRelay<[User]> =  BehaviorRelay<[User]>(value: [])
    let isReloading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    let isLoading: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    
    let errorMessage: PublishRelay<String> = PublishRelay<String>()
    var currentPage: Int = -1 // Beginning not any page is loaded
    var isAllDataLoaded: Bool = false
    
    let usersService = UsersService()
    
    func getData(isReload: Bool = false) {
        if isLoading.value {
            return
        }
        if isAllDataLoaded && !isReload {
            return
        }
        if isReload {
            currentPage = -1
            isAllDataLoaded = false
            isReloading.accept(true)
        }
        isLoading.accept(true)
        usersService.getUsers(page: currentPage + 1) { result in
            switch result {
            case .success(let model):
                if isReload {
                    self.users.accept(model)
                } else {
                    self.users.accept( self.users.value + model)
                }
                self.currentPage += 1
            case .failure(let error):
                self.errorMessage.accept(error.description)
            }
            self.isReloading.accept(false)
            self.isLoading.accept(false)
        }
    }
}
