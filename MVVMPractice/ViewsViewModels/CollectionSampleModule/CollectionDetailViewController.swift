//
//  CollectionDetalViewController.swift
//  MVVMPractice
//
//  Created by iOS Dev on 8/22/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class CollectionDetailViewController: UIViewController {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel! {
        didSet {
            nameLabel.style.mediumRegular().black()
        }
    }
    @IBOutlet private weak var emailLabel: UILabel! {
        didSet {
            emailLabel.style.mediumRegular().black()
        }
    }

    @IBOutlet private weak var favoriteButton: FavoriteCheckBox!

    weak var viewModel: CollectionViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReactive()
    }
    
    private func setupReactive() {
        viewModel.selectedUser.asObservable().ignoreNil().subscribe(onNext: { user in
            self.configure(user: user)
        }).disposed(by: disposeBag)
    }
    
    private func configure(user: User) {
        favoriteButton.isChecked = user.isFavorite.value
        favoriteButton.bind(value: user.isFavorite).disposed(by: disposeBag)
        avatarImageView.loadAvatarUrlString(urlString: user.avatar)
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
