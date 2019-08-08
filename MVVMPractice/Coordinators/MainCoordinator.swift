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
    weak var storyboard: UIStoryboard!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc: MainViewController = storyboard.instantiateViewController()
        self.storyboard = vc.storyboard
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoSignInViewController() {
        let vc: SignInViewController = storyboard.instantiateViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoRegisterViewController() {
        let vc: RegisterViewController = storyboard.instantiateViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoCollectionViewController() {
        let vc: CollectionViewController = storyboard.instantiateViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func gotoTableViewViewController() {
        let vc: TableViewController = storyboard.instantiateViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
}
