//
//  CollectionViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var userImageView: UIImageView!
    
    @IBOutlet private weak var idHeaderLabel: UILabel! {
        didSet {
            idHeaderLabel.style.largeRegular().darkGray().localized(text: "ID:")
        }
    }
    
    @IBOutlet private weak var idLabel: UILabel! {
        didSet {
            idLabel.style.largeRegular().black()
        }
    }
    
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.style.smallRegular().black()
        }
    }
    @IBOutlet private weak var emailLabel: UILabel! {
        didSet {
            emailLabel.style.smallRegular().black()
        }
    }

    @IBOutlet private weak var favoriteButton: FavoriteCheckBox!

    private var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    func configure(user: User) {
        user.isFavorite.distinctUntilChanged().subscribe(onNext: { isFavorite in
            if self.favoriteButton.isChecked != isFavorite {
                self.favoriteButton.isChecked = isFavorite
            }
        }).disposed(by: disposeBag)
        favoriteButton.bind(value: user.isFavorite).disposed(by: disposeBag)
        userImageView.loadAvatarUrlString(urlString: user.avatar)
        idLabel.text = user.id.toString()
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
