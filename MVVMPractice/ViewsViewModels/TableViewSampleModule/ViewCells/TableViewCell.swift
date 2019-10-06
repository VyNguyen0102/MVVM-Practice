//
//  TableViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

protocol TableViewCellDelegate: class {
    func setBookMarkItem(item: Item, isBookmark: Bool)
}

class TableViewCell: UITableViewCell {
    @IBOutlet private weak var bookmarkButton: FavoriteCheckBox!
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.style.largeRegular().black()
        }
    }
    @IBOutlet private weak var emptyImageView: UIView!
    @IBOutlet private weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.style.mediumRegular().darkGray()
        }
    }
    @IBOutlet private weak var expandedContainerView: UIStackView!
    @IBOutlet private weak var imagesCollectionView: ImagesCollectionView!
    @IBOutlet private weak var imagesCollectionViewContainer: UIView!
    
    var disposeBag = DisposeBag()
    weak var delegate: TableViewCellDelegate?
    var item: Item?
    
    @IBOutlet private weak var indicatiorImageView: UIImageView!
    var isNoImages: Bool = true {
        didSet {
            emptyImageView.isHidden = !isNoImages
            imagesCollectionViewContainer.isHidden = isNoImages
        }
    }
    
    var isExpanded: Bool = false {
        didSet {
            indicatiorImageView.image = isExpanded ? #imageLiteral(resourceName: "up-arrow") : #imageLiteral(resourceName: "down-arrow")
            expandedContainerView.isHidden = !isExpanded
        }
    }
    
    override func prepareForReuse() {
        isExpanded = false
        disposeBag = DisposeBag()
    }
    
    func configure(item: Item, isExpanded: Bool = false, isBookmark: Bool = false) {
        self.item = item
        
        titleLabel.text = item.header
        isNoImages = item.isNoImages
        imagesCollectionView.images = item.images
        descriptionLabel.text = item.longDescription
        self.isExpanded = isExpanded
        
        bookmarkButton.isChecked = isBookmark
        bookmarkButton.isCheckedObservable.subscribe(onNext: { isChecked in
            self.delegate?.setBookMarkItem(item: item, isBookmark: isChecked)
        }).disposed(by: disposeBag)
    }
}
