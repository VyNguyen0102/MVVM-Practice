//
//  CustomTextField.swift
//  NVGTest
//
//  Created by iOS Dev on 8/1/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CustomTextField: BaseCustomView {
    
    @IBOutlet private weak var textField: UITextField!
    
    @IBOutlet private weak var mandatoryLabel: UILabel! {
        didSet {
            mandatoryLabel.style.smallRegular().red()
        }
    }
    
    @IBOutlet private weak var errorMessageLabel: UILabel! {
        didSet {
            errorMessageLabel.style.smallRegular().red()
            errorMessageLabel.text = nil
        }
    }
    
    var isMadatory: Bool = false {
        didSet {
            mandatoryLabel.isHidden = !isMadatory
        }
    }
    
    var textFieldError: TextFieldError = .none {
        didSet {
            errorMessageLabel.text = textFieldError.localized
        }
    } 
    
    func configure(viewModel: InputTextViewModel, disposeBag: DisposeBag) {
        textField.rx.text.orEmpty.bind(to: viewModel.inputTextValue).disposed(by: disposeBag)
        textField.placeholder = viewModel.inputType.placeholder
        textField.keyboardType = viewModel.inputType.keyboardType
        textField.isSecureTextEntry = viewModel.inputType.isSecureTextEntry
        isMadatory = viewModel.inputType.isMadatory
        // bind value
        viewModel.errorTextValue.bind { self.textFieldError = $0 }.disposed(by: disposeBag)
        
        // validate input on end editing
        textField.rx.controlEvent(UIControl.Event.editingDidEnd).bind { _ in
            viewModel.validateInput()
        }.disposed(by: disposeBag)
        
        // clear error on begin editing
        textField.rx.controlEvent(UIControl.Event.editingDidBegin).bind { _ in
            viewModel.errorTextValue.accept(.none)
        }.disposed(by: disposeBag)
        
        // validate email, new password by editing change
        if viewModel.inputType == .email || viewModel.inputType == .newPassword {
            textField.rx.controlEvent(UIControl.Event.editingChanged).bind { _ in
                viewModel.validateInput()
            }.disposed(by: disposeBag)
        }
    }
}
