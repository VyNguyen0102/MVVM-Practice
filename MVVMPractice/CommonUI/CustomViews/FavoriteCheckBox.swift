//
//  CheckBox.swift
//  NVGTest
//
//  Created by iOS Dev on 7/12/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

// this is the way you custom control with RxSwift :)
class FavoriteCheckBox: UIButton {
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            self.setImage( isChecked ? #imageLiteral(resourceName: "IconFavouritesActive") : #imageLiteral(resourceName: "IconFavouritesInactive"), for: UIControl.State.normal)
        }
    }
    
    var isCheckedObservable: Observable<Bool> {
        return self.rx.controlEvent(UIControl.Event.touchUpInside).map { _ in
            self.isChecked = !self.isChecked
            return self.isChecked
        }
    }
    
    func bind(value: BehaviorRelay<Bool>) -> Disposable {
        return isCheckedObservable.bind(to: value)
    }
    
    override func awakeFromNib() {
        self.isChecked = false
    }
}

