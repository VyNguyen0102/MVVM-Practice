//
//  MainViewController.swift
//  NVGTest
//
//  Created by Vy Nguyen on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    static var storyboardName = "Main"
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.setupDefaultStyle(withTitle: "Sign In")
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setupDefaultStyle(withTitle: "Register")
        }
    }
    
    @IBOutlet weak var collectionButton: UIButton! {
        didSet {
            collectionButton.setupDefaultStyle(withTitle: "Collection View Sample")
        }
    }
    
    @IBOutlet weak var tableViewButton: UIButton! {
        didSet {
            tableViewButton.setupDefaultStyle(withTitle: "Table View Sample")
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
