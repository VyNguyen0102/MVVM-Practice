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

class ImageTextField: BaseCustomView {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.rx.controlEvent([.editingDidBegin, .editingDidEnd])
                .asObservable()
                .subscribe({ _ in
                    self.separatorView.backgroundColor = self.textField.isEditing ? UIColor.appBlue : UIColor.appLightGray
                    self.imageView.tintColor = self.textField.isEditing ? UIColor.appBlue : UIColor.appLightGray
                })
                .disposed(by: disposeBag)
        }
    }
    @IBOutlet var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = UIColor.appLightGray
        }
    }

    @IBOutlet weak var showHideButton: UIButton! {
        didSet {
            showHideButton.setImage( #imageLiteral(resourceName: "text-field-view-password").withRenderingMode(.alwaysTemplate) , for: .normal)
            showHideButton.tintColor = UIColor.appLightGray
        }
    }

    @IBAction func showHideButtonDidTap(_ sender: Any) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
        showHideButton.tintColor = textField.isSecureTextEntry ? UIColor.appLightGray : UIColor.appBlue
    }

    @IBOutlet weak var validImageView: UIImageView! {
        didSet {
            validImageView.image = #imageLiteral(resourceName: "text-field-valid").withRenderingMode(.alwaysTemplate)
            validImageView.layoutMargins = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
            isValid = false
        }
    }

    var isValid: Bool = false {
        didSet {
            validImageView.tintColor = isValid ? UIColor.appBlue : UIColor.appLightGray
        }
    }
    
    @IBOutlet private weak var errorMessageLabel: UILabel! {
        didSet {
            errorMessageLabel.style.smallRegular().red()
            errorMessageLabel.text = nil
        }
    }
    
    var textFieldError: TextFieldError = .none {
        didSet {
            errorMessageLabel.text = textFieldError.localized
        }
    }

    let disposeBag: DisposeBag = DisposeBag()
    
    func configure(viewModel: InputTextViewModel, disposeBag: DisposeBag) {
        textField.rx.text.orEmpty.bind(to: viewModel.inputTextValue).disposed(by: disposeBag)
        textField.placeholder = viewModel.inputType.placeholder
        textField.keyboardType = viewModel.inputType.keyboardType
        textField.isSecureTextEntry = viewModel.inputType.isSecureTextEntry
        showHideButton.isHidden = !viewModel.inputType.isSecureTextEntry
        if let icon = viewModel.inputType.icon {
            imageView.image = icon.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = UIColor.appLightGray
        } else {
            imageView.isHidden = true
        }

        if viewModel.inputType.isShowValid {
            self.isValid = false
            viewModel.isValidObservable.bind(onNext: {
                self.isValid = $0
            }).disposed(by: disposeBag)
        } else {
            validImageView.isHidden = true
        }

        // bind value
        viewModel.errorTextValue.bind { self.textFieldError = $0 }.disposed(by: disposeBag)
        
        // validate input on end editing
        textField.rx.controlEvent(UIControl.Event.editingDidEnd).bind { _ in
            viewModel.validateInput()
        }.disposed(by: disposeBag)
        
        // validate email, new password by editing change
        if viewModel.inputType == .email || viewModel.inputType == .newPassword {
            textField.rx.controlEvent(UIControl.Event.editingChanged).bind { _ in
                viewModel.validateInput()
            }.disposed(by: disposeBag)
        }
    }
}
