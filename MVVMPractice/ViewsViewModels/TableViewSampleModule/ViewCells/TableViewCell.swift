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
    @IBOutlet weak var bookmarkButton: FavoriteCheckBox!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.style = .largeText
        }
    }
    @IBOutlet weak var emptyImageView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.style = .smallText
        }
    }
    @IBOutlet weak var expandedContainerView: UIStackView!
    @IBOutlet weak var imagesCollectionView: ImagesCollectionView!
    @IBOutlet weak var imagesCollectionViewContainer: UIView!
    
    var disposeBag = DisposeBag()
    weak var delegate: TableViewCellDelegate?
    var item: Item?
    
    @IBOutlet weak var indicatiorImageView: UIImageView!
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
        bookmarkButton.isChecked = isBookmark
        titleLabel.text = item.header
        isNoImages = item.isNoImages
        imagesCollectionView.images = item.images
        descriptionLabel.text = item.longDescription
        self.isExpanded = isExpanded
        bookmarkButton.isCheckedObservable.subscribe(onNext: { isChecked in
            self.delegate?.setBookMarkItem(item: item, isBookmark: isChecked)
        }).disposed(by: disposeBag)
    }
}
