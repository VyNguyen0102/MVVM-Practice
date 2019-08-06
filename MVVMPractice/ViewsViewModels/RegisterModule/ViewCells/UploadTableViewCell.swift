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

protocol UploadTableViewCellDelegate: class {
    func selectFileWith(type: UploadViewModel)
}

class UploadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var documentTypeLabel: UILabel! {
        didSet {
            documentTypeLabel.style = .largeHeaderText
            documentTypeLabel.numberOfLines = 2
            documentTypeLabel.textAlignment = .center
        }
    }
    
    @IBOutlet weak var documentNameLabel: UILabel! {
        didSet {
            documentNameLabel.style = .smallHeaderText
            documentNameLabel.lineBreakMode = .byTruncatingHead
        }
    }
    
    @IBOutlet weak var uploadProgressView: UIProgressView! {
        didSet {
            uploadProgressView.tintColor = UIColor.appGreen
        }
    }
    
    @IBOutlet weak var uploadButton: UIButton! {
        didSet {
            uploadButton.setupButtonDefaultStype()
            uploadButton.setTitle("Upload", for: .normal)
        }
    }
    
    weak var delegate: UploadTableViewCellDelegate?
    weak var uploadModel: UploadViewModel?
    private var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configure(uploadModel: UploadViewModel) {
        self.uploadModel = uploadModel
        documentTypeLabel.text = uploadModel.documentTypeName
        uploadModel.documentName.subscribe(onNext: { documentName in
            self.documentNameLabel.text = documentName
        }).disposed(by: disposeBag)
        uploadModel.uploadProgress.bind(to: self.uploadProgressView.rx.progress).disposed(by: disposeBag)
    }
    
    @IBAction func uploadButtonDidTap(_ sender: Any) {
        if let uploadModel = uploadModel {
            delegate?.selectFileWith(type: uploadModel)
        }
    }
}
