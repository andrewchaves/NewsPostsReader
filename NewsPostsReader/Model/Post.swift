//
//  Post.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//
struct Post: Decodable{
    var id: Int
    var headline: String
    var content: String
    var author: String
}
