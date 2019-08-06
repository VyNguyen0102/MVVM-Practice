//
//  MainFlowLayout.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private var firstSetupDone = false
    
    private var contentInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
    
    var numberOfColumns: Int {
        switch UIDevice.current.userInterfaceIdiom {
        case .unspecified, .phone, .carPlay:
            return 1
        case .pad, .tv:
            return 2
        @unknown default:
            return 1
        }
    }
    
    fileprivate var contentHeight: CGFloat = 100
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return floor( (collectionView.bounds.width - (insets.left + insets.right)) / CGFloat(numberOfColumns))
    }
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            setup()
            firstSetupDone = true
        }
    }
    
    private func setup() {
        collectionView?.contentInset = contentInset
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = .vertical
        itemSize = CGSize(width: contentWidth, height: contentHeight)
        collectionView!.decelerationRate = UIScrollView.DecelerationRate.fast
    }
}
