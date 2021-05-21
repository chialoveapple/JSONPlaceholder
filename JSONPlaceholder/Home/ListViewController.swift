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
    var searchController: UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()

        initTableView()
        setSearchController()
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

    private func setSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.searchBar.delegate = self
        searchController?.hidesNavigationBarDuringPresentation = false
        searchController?.obscuresBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchController
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.searchResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaceholderCell.className, for: indexPath) as! PlaceholderCell
        cell.updateCellWith(object: vm.searchResult[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController?.searchBar.resignFirstResponder()
        print("result: \(vm.searchResult[indexPath.row])")
    }

}

extension ListViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            vm.search(text: searchText)
        }
    }

}

extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            vm.search(text: searchText)
        }
    }
}

extension ListViewController: ListViewControllerDelegate {
    func reloadDataResult() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
