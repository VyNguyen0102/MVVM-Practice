//
//  ProfileViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 7/25/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(DocumentTypeTableViewCell.string,
                               TextTableViewCell.string,
                               UploadTableViewCell.string)
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.allowsSelection = false
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.style.normal().localized(text: "SUBMIT")
        }
    }
    
    let imagePicker: UIImagePickerController = {
        var imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    let viewModel = RegisterViewModel()
    let disposeBag = DisposeBag()
    
    var profileInputs: [ProfileInputType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        let start = CFAbsoluteTimeGetCurrent()
        setupReactive()
        let diff = CFAbsoluteTimeGetCurrent() - start
        print("Took \(diff) seconds")
    }
    
    func setupReactive()  {
        viewModel.profileInputs.subscribe(onNext: { profileInputs in
            self.profileInputs = profileInputs
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
        viewModel.selectedDocument.asObservable().ignoreNil().subscribe(onNext: { uploadViewModel in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }).disposed(by: disposeBag)
    }
    
    @IBAction func submitButtonDidTap(_ sender: Any) {
        viewModel.submit()
    }
}

extension RegisterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInputs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = profileInputs[indexPath.row]
        switch type {
        case .documentType(let isSenior):
            let cell: DocumentTypeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(isSenior: isSenior)
            return cell
        case .inputText(let viewModel):
            let cell: TextTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(viewModel: viewModel)
            return cell
        case .document(let type):
            let cell: UploadTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(uploadModel: type, selectedDocument: viewModel.selectedDocument)
            return cell
        }
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        viewModel.selectedDocument.value?.selectDocument(info: info)
        viewModel.selectedDocument.accept(nil)
        self.dismiss(animated: true, completion: nil)
    }
}
