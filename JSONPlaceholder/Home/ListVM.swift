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

    var allDataResult: [JSONPlaceholderDetail] = [] {
        didSet {
            self.delegate?.reloadDataResult()
        }
    }

    var searchResult: [JSONPlaceholderDetail] = [] {
        didSet {
            self.delegate?.reloadDataResult()
        }
    }

    weak var delegate: ListViewControllerDelegate?

    func getListData() {
        ApiManager.shared.getJSONPlaceholderData() { (data) in
            if let dataResult = data {
                self.allDataResult = dataResult
                self.searchResult = dataResult
            }
        }
    }

    func search(text: String) {
        guard text != "" else { return self.searchResult = self.allDataResult }


        let searchData = allDataResult.filter { (data) -> Bool in

//            return data.title.contains(text)
            return data.title.localizedCaseInsensitiveContains(text)
        }
        self.searchResult = searchData
    }

}
