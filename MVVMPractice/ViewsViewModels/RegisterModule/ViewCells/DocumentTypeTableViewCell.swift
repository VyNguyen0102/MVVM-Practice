//
//  DocumentTypeTableViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/30/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DocumentTypeTableViewCell: UITableViewCell {

    @IBOutlet private weak var documentTypeSegmentedControl: UISegmentedControl! {
        didSet {
            documentTypeSegmentedControl.tintColor = UIColor.appGreen
            documentTypeSegmentedControl.setTitle("Senior", forSegmentAt: 0)
            documentTypeSegmentedControl.setTitle("Junior", forSegmentAt: 1)
        }
    }
    
    // map from int to bool
    var isSeniorObservable: Observable<Bool> {
        return documentTypeSegmentedControl.rx.value.map({ selectedValue in
            switch selectedValue {
            case 0:
                return true
            default:
                return false
            }
        })
    }
    
    private var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configure(isSenior: BehaviorRelay<Bool>) {
        documentTypeSegmentedControl.selectedSegmentIndex = isSenior.value ? 0 : 1
        isSeniorObservable.bind(to: isSenior).disposed(by: disposeBag)
    }
}
