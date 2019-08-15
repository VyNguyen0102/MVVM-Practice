//
//  UploadViewModel.swift
//  NVGTest
//
//  Created by iOS Dev on 8/1/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import RxRelay

class UploadViewModel {
    
    var documentTypeName: String
    var documentName: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    let uploadProgress: BehaviorRelay<Float> = BehaviorRelay<Float>(value: 0.0)
    // UIImage store here
    
    init(documentTypeName: String) {
        self.documentTypeName = documentTypeName
    }
    
    func selectDocument(info: [UIImagePickerController.InfoKey : Any]) {
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? NSURL {
            documentName.accept(url.absoluteString ?? "")
        }
    }
}
