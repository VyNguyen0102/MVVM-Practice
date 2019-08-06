//
//  UIImageViewExtension.swift
//  NVGTest
//
//  Created by iOS Dev on 7/12/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func loadAvatarUrlString(urlString: String?) {
        if let url = URL.init(string: urlString ?? "") {
            Nuke.loadImage(with: url, options: Configuration.imageLoadOptions, into: self)
        }
    }
}
