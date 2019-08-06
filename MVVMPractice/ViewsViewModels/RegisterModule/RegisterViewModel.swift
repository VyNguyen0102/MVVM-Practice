//
//  ProfileViewModel.swift
//  NVGTest
//
//  Created by iOS Dev on 7/25/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

enum ProfileInputType {
    case documentType(isSenior: BehaviorRelay<Bool> )
    case inputText(viewModel: InputTextViewModel)
    case document(viewModel: UploadViewModel)
}

class RegisterViewModel {
    
    let isSeniorDeveloper: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    let firstName: InputTextViewModel = InputTextViewModel.init(inputType: .firstName)
    let lastName: InputTextViewModel = InputTextViewModel.init(inputType: .lastName)
    let email: InputTextViewModel = InputTextViewModel.init(inputType: .email)
    let universityName: InputTextViewModel = InputTextViewModel.init(inputType: .universityName)
    
    let cvDocument = UploadViewModel.init(documentTypeName: "CV")
    let bsDocument = UploadViewModel.init(documentTypeName: "Bachelor of Science")
    weak var selectedDocument: UploadViewModel?
    
    var profileInputs: Observable<[ProfileInputType]> {
        return isSeniorDeveloper.distinctUntilChanged().map({ isSeniorDeveloper in
            if isSeniorDeveloper {
                return [.documentType(isSenior: self.isSeniorDeveloper),
                        .inputText(viewModel: self.firstName),
                        .inputText(viewModel: self.lastName),
                        .inputText(viewModel: self.email),
                        .document(viewModel: self.cvDocument)]
            } else {
                return [.documentType(isSenior: self.isSeniorDeveloper),
                        .inputText(viewModel: self.firstName),
                        .inputText(viewModel: self.lastName),
                        .inputText(viewModel: self.email),
                        .inputText(viewModel: self.universityName),
                        .document(viewModel: self.bsDocument)]
            }
        })
    }
    
    func submit() {

        guard firstName.validateInput() else {
            return
        }
        guard email.validateInput() else {
            return
        }
        
        print("First Name: \(firstName.inputTextValue.value)")
        print("Last Name: \(lastName.inputTextValue.value)")
        print("Email: \(email.inputTextValue.value)")
        
        print("upload file : \(cvDocument.documentName.value)")
        print("upload file : \(bsDocument.documentName.value)")
        
        cvDocument.uploadProgress.accept(1.0)
        bsDocument.uploadProgress.accept(1.0)
        
        print("DONE :)")
        
    }
}
