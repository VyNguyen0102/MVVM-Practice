//
//  BaseViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorMessage(message: String)  {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
