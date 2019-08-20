//
//  MainViewController.swift
//  NVGTest
//
//  Created by Vy Nguyen on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.style.normal().localized(text: "Sign In")
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.style.normal().localized(text: "Register")
        }
    }
    
    @IBOutlet weak var collectionButton: UIButton! {
        didSet {
            collectionButton.style.normal().localized(text: "Collection View Sample")
        }
    }
    
    @IBOutlet weak var tableViewButton: UIButton! {
        didSet {
            tableViewButton.style.normal().localized(text: "Table View Sample")
        }
    }
    
    @IBAction func signInButtonButton(_ sender: Any) {
        coordinator?.gotoSignInViewController()
    }
    
    @IBAction func registerButtonButton(_ sender: Any) {
        coordinator?.gotoRegisterViewController()
    }
    
    @IBAction func collectionButton(_ sender: Any) {
        coordinator?.gotoCollectionViewController()
    }

    @IBAction func tableViewButtonDidTap(_ sender: Any) {
        coordinator?.gotoTableViewViewController()
    }

}
