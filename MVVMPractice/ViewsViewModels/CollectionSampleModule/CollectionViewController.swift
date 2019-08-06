//
//  ViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class CollectionViewController: UIViewController, Storyboarded {
    static var storyboardName: String = "Main"
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var emptyDataView: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib.init(nibName: CollectionViewCell.string, bundle: Bundle.main), forCellWithReuseIdentifier: CollectionViewCell.string)
            collectionView.alwaysBounceVertical = true
            collectionView.addSubview(refresher)
            collectionView.collectionViewLayout = CustomCollectionViewFlowLayout()
            collectionView.dataSource = self
        }
    }
    
    let refresher: UIRefreshControl = {
        let refresher = UIRefreshControl()
        refresher.tintColor = UIColor.red
        refresher.addTarget(self, action: #selector(refeshData), for: .valueChanged)
        return refresher
    }()
    
    let viewModel = CollectionViewModel()
    let disposeBag = DisposeBag()
    
    var isViewLoading: Bool = true {
        didSet {
            // need to replace by beautiful loading
            loadingView.isHidden = !isViewLoading
        }
    }
    
    var isEmptyData: Bool = true {
        didSet {
            emptyDataView.isHidden = !isEmptyData
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupReactive()
        viewModel.getData(isReload: true)
    }
    
    @IBAction func reloadButtonDidTap(_ sender: Any) {
        refeshData()
    }
    
    @objc func refeshData() {
        viewModel.getData(isReload: true)
    }
    
    func setupReactive() {
        viewModel.users.subscribe(onNext: { users in
            self.isEmptyData = (users.count == 0)
            self.collectionView.reloadData()
        }).disposed(by: disposeBag)
        viewModel.errorMessage.subscribe(onNext: { message in
            self.showErrorMessage(message: message)
        }).disposed(by: disposeBag)
        viewModel.isReloading.subscribe(onNext: { isReloading in
            self.isViewLoading = isReloading
        }).disposed(by: disposeBag)
        viewModel.isLoading.subscribe(onNext: { isLoading in
            if !isLoading {
                self.refresher.endRefreshing()
            }
        }).disposed(by: disposeBag)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.users.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.string, for: indexPath) as! CollectionViewCell
        let user = viewModel.users.value[indexPath.row]
        cell.configure(user: user)
        if indexPath.row + Configuration.loadMoreOffset >= viewModel.users.value.count {
            viewModel.getData()
        }
        return cell
    }
    
}
