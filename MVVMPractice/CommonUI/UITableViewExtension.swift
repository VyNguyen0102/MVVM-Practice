//
//  UITableViewExtension.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/21/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UITableView {
    // Register cell with class name identifier
    func register(_ nibNames: String...) {
        nibNames.forEach { nibName in
            self.register(UINib.init(nibName: nibName, bundle: Bundle.main),
                          forCellReuseIdentifier: nibName)
        }
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = Cell.string
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("You must register cell with class name identifier!")
        }
        return cell
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>() -> Cell {
        let identifier = Cell.string
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("You must register cell with class name identifier!")
        }
        return cell
    }
}

extension UICollectionView {
    func register(_ nibNames: String...) {
        nibNames.forEach { nibName in
            self.register(UINib.init(nibName: nibName, bundle: Bundle.main),
                          forCellWithReuseIdentifier: nibName)
        }
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = Cell.string
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("You must register cell with class name identifier!")
        }
        return cell
    }
}
