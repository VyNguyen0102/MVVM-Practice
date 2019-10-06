//
//  MainViewController.swift
//  NVGTest
//
//  Created by Vy Nguyen on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    weak var coordinator: MainCoordinator!
    
    @IBOutlet private weak var signInButton: UIButton! {
        didSet {
            signInButton.style.normal().localized(text: "Sign In")
        }
    }
    
    @IBOutlet private weak var registerButton: UIButton! {
        didSet {
            registerButton.style.normal().localized(text: "Register")
        }
    }
    
    @IBOutlet private weak var collectionButton: UIButton! {
        didSet {
            collectionButton.style.normal().localized(text: "Collection View Sample")
        }
    }
    
    @IBOutlet private weak var tableViewButton: UIButton! {
        didSet {
            tableViewButton.style.normal().localized(text: "Table View Sample")
        }
    }
    
    @IBAction private func signInButtonButton(_ sender: Any) {
        coordinator.gotoSignInViewController()
    }
    
    @IBAction private func registerButtonButton(_ sender: Any) {
        coordinator.gotoRegisterViewController()
    }
    
    @IBAction private func collectionButton(_ sender: Any) {
        coordinator.gotoCollectionViewController()
    }

    @IBAction private func tableViewButtonDidTap(_ sender: Any) {
        coordinator.gotoTableViewViewController()
    }

}
