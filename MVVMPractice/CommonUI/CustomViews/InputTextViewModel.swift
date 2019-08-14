//
//  CustomTextFieldModel.swift
//  NVGTest
//
//  Created by iOS Dev on 8/1/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import RxRelay
import RxSwift

class InputTextViewModel {
    var inputType: InputType
    let inputTextValue: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    let errorTextValue: BehaviorRelay<TextFieldError> = BehaviorRelay<TextFieldError>(value: .none)
    init(inputType: InputType) {
        self.inputType = inputType
    }
    
    var isValidObservable: Observable<Bool> {
        return inputTextValue.map { _ in
            return self.isValid
        }
    }
    
    var isValid: Bool {
        if inputType.isMadatory && isEmpty {
            return false
        }
        if inputType == .email && !isEmail {
            return false
        }
        return true
    }
    // Handle empty, validated field...
    
    @discardableResult
    func validateInput() -> Bool { // true mean valid
        errorTextValue.accept(.none)
        if inputType.isMadatory && !validateEmpty() {
            return false
        }
        if inputType == .email && !validateEmail() {
            return false
        }
        if inputType == .newPassword && !validatePassword()  {
            return false
        }
        return true
    }
    
    var isEmpty: Bool {
        return inputTextValue.value.isEmpty
    }
    
    @discardableResult
    func validateEmpty() -> Bool { // true mean valid
        if isEmpty {
            errorTextValue.accept(.empty)
            return false
        }
        return true
    }
    
    var isEmail: Bool {
        return inputTextValue.value.isValidEmail
    }
    
    @discardableResult
    func validateEmail() -> Bool { // true mean email valid
        if validateEmpty() && !isEmail {
            errorTextValue.accept(.notValidEmail)
            return false
        }
        return true
    }
    
    var passwordCheck: PasswordRequirement {
        return inputTextValue.value.isValidPassword()
    }
    
    var isValidPassword: Bool {
        return passwordCheck == .validPassword
    }

    @discardableResult
    func validatePassword() -> Bool { // true mean email valid
        if validateEmpty() && !isValidPassword {
            errorTextValue.accept(.notValidPassword(passwordCheckResult: passwordCheck))
            return false
        }
        return true
    }
}
