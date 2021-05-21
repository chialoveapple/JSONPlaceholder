//
//  ApiManager.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/20.
//

import Foundation

class ApiManager {

    static let shared = ApiManager()

    func getJSONPlaceholderData(completion: @escaping ([JSONPlaceholderDetail]?) -> ()) {
        let urlStr = "https://jsonplaceholder.typicode.com/photos"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data ,let placeholderData = try? JSONDecoder().decode([JSONPlaceholderDetail].self, from: data) {
                    completion(placeholderData)
//                    print("data = \(musicData.first?.title)")
                } else {
                    completion(nil)
                }
            }.resume()
        }
    }
}
