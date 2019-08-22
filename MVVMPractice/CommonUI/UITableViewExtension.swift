//
//  UITableViewExtension.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/21/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(_ nibNames: String...) {
        nibNames.forEach { nibName in
            self.register(UINib.init(nibName: nibName, bundle: Bundle.main),
                          forCellReuseIdentifier: nibName)
        }
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = Cell.string
        return self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! Cell
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>() -> Cell {
        let identifier = Cell.string
        return self.dequeueReusableCell(withIdentifier: identifier) as! Cell
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
        return self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Cell
    }
}
