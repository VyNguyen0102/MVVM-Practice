//
//  ViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 7/9/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class CollectionViewController: UIViewController {
    
    weak var coordinator: MainCoordinator!
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var emptyDataView: UIView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            // every property of view sould be here to make everything clear
            // Storyboard, Xib file is only for layout.
            collectionView.register(CollectionViewCell.string)
            collectionView.alwaysBounceVertical = true
            collectionView.addSubview(refresher)
            collectionView.collectionViewLayout = CustomCollectionViewFlowLayout()
            collectionView.dataSource = self
            collectionView.allowsSelection = true
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
        // I'm not using bind for list users because i think it not necessary
        // Make everything as simple as possible
        // Delegate make other developers feel "safe" when they maintenance your code.
        // if you familiar with RxDataSources you can use for fully suppord multiple sections type, multiple cells type
        viewModel.users.subscribe(onNext: { users in
            self.isEmptyData = users.isEmpty
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
        collectionView.rx.itemSelected.subscribe(onNext: { indexPath in
            self.viewModel.selectItemAt(indexPath: indexPath)
        }).disposed(by: disposeBag)
        viewModel.selectedUser.asObservable().ignoreNil().subscribe(onNext: { _ in
            self.coordinator.gotoCollectionViewDetailViewController(viewModel: self.viewModel)
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
