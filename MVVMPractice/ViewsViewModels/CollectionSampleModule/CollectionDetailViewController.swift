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
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.style.mediumRegular().black()
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            emailLabel.style.mediumRegular().black()
        }
    }
    
    weak var viewModel: CollectionViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupReactive()
    }
    
    func setupReactive() {
        viewModel.selectedUser.asObservable().ignoreNil().subscribe(onNext: { user in
            self.configure(user: user)
        }).disposed(by: disposeBag)
    }
    
    func configure(user: User) {
        avatarImageView.loadAvatarUrlString(urlString: user.avatar)
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
