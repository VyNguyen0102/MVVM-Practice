//
//  UploadTableViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/26/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class UploadTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var documentTypeLabel: UILabel! {
        didSet {
            documentTypeLabel.style.largeRegular().black()
            documentTypeLabel.numberOfLines = 2
            documentTypeLabel.textAlignment = .center
        }
    }
    
    @IBOutlet private weak var documentNameLabel: UILabel! {
        didSet {
            documentNameLabel.style.smallRegular().black() // = .smallHeaderText
            documentNameLabel.lineBreakMode = .byTruncatingHead
        }
    }
    
    @IBOutlet private weak var uploadProgressView: UIProgressView! {
        didSet {
            uploadProgressView.tintColor = UIColor.appGreen
        }
    }
    
    @IBOutlet private weak var uploadButton: UIButton! {
        didSet {
            uploadButton.style.normal().localized(text: "Upload")
        }
    }
    
    private var selectedDocument: Observable<UploadViewModel?> {
        return uploadButton.rx.tap.asObservable().map { _ in
            return self.uploadModel
        }
    }
    
    weak var uploadModel: UploadViewModel?
    private var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configure(uploadModel: UploadViewModel, selectedDocument: BehaviorRelay<UploadViewModel?>) {
        self.uploadModel = uploadModel
        documentTypeLabel.text = uploadModel.documentTypeName
        uploadModel.documentName.subscribe(onNext: { documentName in
            self.documentNameLabel.text = documentName
        }).disposed(by: disposeBag)
        uploadModel.uploadProgress.bind(to: self.uploadProgressView.rx.progress).disposed(by: disposeBag)
        self.selectedDocument.bind(to: selectedDocument).disposed(by: disposeBag)
    }
}
