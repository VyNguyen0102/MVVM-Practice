//
//  EmailTableViewCell.swift
//  NVGTest
//
//  Created by iOS Dev on 7/25/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TextTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var textField: CustomTextField!
    private var disposeBag: DisposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    func configure(viewModel: InputTextViewModel) {
        textField.configure(viewModel: viewModel, disposeBag: disposeBag)
    }
    
}
