//
//  CollectionViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var idHeaderLabel: UILabel! {
        didSet {
            idHeaderLabel.style = .largeHeaderText
            idHeaderLabel.text = "ID:" // Localize Here
        }
    }
    
    @IBOutlet weak var idLabel: UILabel! {
        didSet {
            idLabel.style = .largeText
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.style = .smallText
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.style = .smallText
        }
    }

    func configure(user: User) {
        userImageView.loadAvatarUrlString(urlString: user.avatar)
        idLabel.text = user.id.toString()
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
