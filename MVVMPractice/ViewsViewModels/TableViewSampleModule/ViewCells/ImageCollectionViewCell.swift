//
//  ImageCollectionViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    
    func configure(imageUrl: String) {
        imageView.loadAvatarUrlString(urlString: imageUrl)
    }
}
