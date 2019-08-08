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
            tableView.register(UINib.init(nibName: DocumentTypeTableViewCell.string, bundle: Bundle.main),
                               forCellReuseIdentifier: DocumentTypeTableViewCell.string)
            tableView.register(UINib.init(nibName: TextTableViewCell.string, bundle: Bundle.main),
                               forCellReuseIdentifier: TextTableViewCell.string)
            tableView.register(UINib.init(nibName: UploadTableViewCell.string, bundle: Bundle.main),
                               forCellReuseIdentifier: UploadTableViewCell.string)
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
            tableView.allowsSelection = false
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.backgroundColor = UIColor.appGreen
            submitButton.setTitleColor(UIColor.appTextWhite, for: UIControl.State.normal)
            submitButton.setTitle("SUBMIT", for: UIControl.State.normal)
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
        setupReactive()
    }
    func setupReactive()  {
        viewModel.profileInputs.subscribe(onNext: { profileInputs in
            self.profileInputs = profileInputs
            self.tableView.reloadData()
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
            let cell = tableView.dequeueReusableCell(withIdentifier: DocumentTypeTableViewCell.string, for: indexPath) as! DocumentTypeTableViewCell
            cell.configure(isSenior: isSenior)
            return cell
        case .inputText(let viewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.string, for: indexPath) as! TextTableViewCell
            cell.configure(viewModel: viewModel)
            return cell
        case .document(let type):
            let cell = tableView.dequeueReusableCell(withIdentifier: UploadTableViewCell.string, for: indexPath) as! UploadTableViewCell
            cell.configure(uploadModel: type)
            cell.delegate = self
            return cell
        }
    }
}

extension RegisterViewController: UploadTableViewCellDelegate {
    func selectFileWith(type: UploadViewModel) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            viewModel.selectedDocument = type
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        viewModel.selectedDocument?.selectDocument(info: info)
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        viewModel.selectedDocument = nil
    }
}
