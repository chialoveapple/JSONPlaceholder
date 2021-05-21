//
//  ListVM.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/20.
//

protocol ListViewControllerDelegate: class {
    func reloadDataResult()
}

import Foundation

class ListVM {

    var dataResult: [JSONPlaceholderDetail] = [] {
        didSet {
            self.delegate?.reloadDataResult()
        }
    }
    weak var delegate: ListViewControllerDelegate?

    func getListData() {
        ApiManager.shared.getJSONPlaceholderData() { (data) in
            if let dataResult = data {
                self.dataResult = dataResult
            }
        }
    }


}
