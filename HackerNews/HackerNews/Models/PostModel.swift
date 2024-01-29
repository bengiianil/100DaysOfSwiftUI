//
//  PostModel.swift
//  HackerNews
//
//  Created by Bengi Anıl on 13.03.2023.
//

import Foundation

struct PostModel: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
