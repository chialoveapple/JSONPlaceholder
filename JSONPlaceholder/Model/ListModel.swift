//
//  ListModel.swift
//  JSONPlaceholder
//
//  Created by Sandy Huang on 2021/5/20.
//

import Foundation

struct JSONPlaceholderDetail: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
