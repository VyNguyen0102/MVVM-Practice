//
//  MainCoordinator.swift
//  NVGTest
//
//  Created by iOS Dev on 7/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoSignInViewController() {
        let vc = SignInViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoRegisterViewController() {
        let vc = RegisterViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoCollectionViewController() {
        let vc = CollectionViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoTableViewViewController() {
        let vc = TableViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
    
}
