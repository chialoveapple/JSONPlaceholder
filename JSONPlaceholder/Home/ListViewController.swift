//
//  ListViewController.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/20.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let vm = ListVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        getListData()
        vm.delegate = self
    }

    private func initTableView() {
        tableView.register(PlaceholderCell.self, forCellReuseIdentifier: PlaceholderCell.className)
        tableView.tableFooterView = UIView()
    }

    private func getListData() {
        vm.getListData()
    }

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.dataResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
        cell.updateCellWith(object: vm.dataResult[indexPath.row])
        return cell
    }

}

extension ListViewController: ListViewControllerDelegate {
    func reloadDataResult() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
