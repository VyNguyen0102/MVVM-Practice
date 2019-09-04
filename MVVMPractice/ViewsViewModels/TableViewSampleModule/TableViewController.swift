//
//  TableViewController.swift
//  NVGTest
//
//  Created by iOS Dev on 7/11/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import UIKit
import RxSwift

class TableViewController: UIViewController {
    weak var coordinator: MainCoordinator!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(TableViewCell.string)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 300
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    let viewModel = TableViewModel()
    let disposeBag = DisposeBag()
    
    var selectedRow: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        setupReactive()
        viewModel.loadData()
    }
    
    func setupReactive()  {
        viewModel.items.subscribe(onNext: { _ in
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastSelectedIndex = (self.selectedRow >= 0) ? IndexPath.init(row: self.selectedRow, section: indexPath.section) : nil
        self.selectedRow = (self.selectedRow == indexPath.row) ? -1 : indexPath.row
        tableView.deselectRow(at: indexPath, animated: false)
        tableView.reloadRows(at: [indexPath, lastSelectedIndex].compactMap { $0 }, with: UITableView.RowAnimation.fade)
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = viewModel.items.value[indexPath.row]
        let isBookmarked = viewModel.bookmarkList.value.contains(item.id)
        cell.configure(item: item, isExpanded: indexPath.row == self.selectedRow,isBookmark: isBookmarked)
        cell.delegate = self
        return cell
    }
}

extension TableViewController: TableViewCellDelegate {
    func setBookMarkItem(item: Item, isBookmark: Bool) {
        viewModel.setBookmark(item: item, isBookmark: isBookmark)
    }
}
