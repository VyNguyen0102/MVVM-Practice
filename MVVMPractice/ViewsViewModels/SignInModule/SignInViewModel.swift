//
//  SignInViewModel.swift
//  NVGTest
//
//  Created by iOS Dev on 8/2/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

class SignInViewModel {
    
    // Replace Bool by your sign in result model
    let signInResult: PublishRelay<Bool> = PublishRelay<Bool>()
    
    let email: InputTextViewModel = InputTextViewModel.init(inputType: .email)
    let password: InputTextViewModel = InputTextViewModel.init(inputType: .password)
    
    var isValidSignIn: Observable<Bool> {
        return Observable.combineLatest(email.isValidObservable, password.isValidObservable) { (emailIsValid, passwordIsValid) in
            return emailIsValid && passwordIsValid
        }
    }
    
    func signIn() {
        
        print("email: \(email.inputTextValue.value)")
        print("password: \(password.inputTextValue.value)")
        // Sign In complete or fail return here
        signInResult.accept(true)
    }
}
