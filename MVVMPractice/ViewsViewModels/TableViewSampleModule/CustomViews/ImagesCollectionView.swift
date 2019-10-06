//
//  ImagesCollectionView.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit

class ImagesCollectionView: BaseCustomView {
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib.init(nibName: ImageCollectionViewCell.string, bundle: Bundle.main),
                                    forCellWithReuseIdentifier: ImageCollectionViewCell.string)
            collectionView.dataSource = self
            collectionView.delegate = self
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.scrollDirection = .horizontal
            collectionView.collectionViewLayout = layout
        }
    }

    var images: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension ImagesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(imageUrl: images[indexPath.row])
        return cell
    }
}

extension ImagesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.height * 0.9, height: collectionView.frame.size.height)
    }
}
