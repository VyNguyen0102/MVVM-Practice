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
            idHeaderLabel.style.largeRegular().darkGray().localized(text: "ID:")
        }
    }
    
    @IBOutlet weak var idLabel: UILabel! {
        didSet {
            idLabel.style.largeRegular().black()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.style.smallRegular().black()
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.style.smallRegular().black()
        }
    }

    func configure(user: User) {
        userImageView.loadAvatarUrlString(urlString: user.avatar)
        idLabel.text = user.id.toString()
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
