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
            signInButton.setupButtonDefaultStype()
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setupButtonDefaultStype()
            registerButton.setTitle("Register", for: .normal)
        }
    }
    
    @IBOutlet weak var collectionButton: UIButton! {
        didSet {
            collectionButton.setupButtonDefaultStype()
            collectionButton.setTitle("Collection View Sample", for: .normal)
        }
    }
    
    @IBOutlet weak var tableViewButton: UIButton! {
        didSet {
            tableViewButton.setupButtonDefaultStype()
            tableViewButton.setTitle("Table View Sample", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
