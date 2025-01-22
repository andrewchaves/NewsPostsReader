//
//  Post.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//

enum Category: String, Codable {
    case world
    case politics
    case technology
    case finances
}

struct Post: Decodable {
    var id: String
    var headline: String
    var content: String
    var author: String
    var category: Category
}
