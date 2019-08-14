//
//  SignInViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 8/2/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.setupDefaultStyle(withTitle: "Sign In")
        }
    }
    
    let viewModel = SignInViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReactive()
    }
    
    func setupReactive() {
        emailTextField.configure(viewModel: viewModel.email, disposeBag: disposeBag)
        passwordTextField.configure(viewModel: viewModel.password, disposeBag: disposeBag)
        viewModel.isValidSignIn.bind(to: signInButton.rx.isEnabled).disposed(by: disposeBag)
        viewModel.signInResult.subscribe(onNext: { _ in
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func signInButtonDidTap(_ sender: Any) {
        viewModel.signIn()
    }
    
}
