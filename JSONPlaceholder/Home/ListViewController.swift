//
//  ListViewController.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/20.
//

import UIKit

class ListViewController: UIViewController {

    let vm = ListVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getListData()
        vm.delegate = self
    }

    private func setupUI() {

    }

    private func getListData() {
        vm.getListData()
    }

}

extension ListViewController: ListViewControllerDelegate {
    func reloadDataResult() {
        
    }
}
