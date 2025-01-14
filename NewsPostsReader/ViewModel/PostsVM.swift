//
//  PostVM.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 14/01/25.
//
import Foundation

class PostVM {
    private let api = Service()
    var onError: ((String) -> Void)?
    var onPostsUpdated: (() -> Void)?
    var posts: [Post]?
    
    func fetchNewsPosts() {
        Task {
            do {
                posts = try await api.makeRequest(endpoint: "posts", method: .GET, responseType: [Post].self)
                print("Result: \(posts ?? [])")
                self.onPostsUpdated?()
            }catch let error as APIError {
                self.onError?(self.handleError(error))
            } catch {
                print("Misterious Error")
            }
        }
    }
}

extension PostVM {
    func handleError(_ error: Error) -> String {
        guard let apiError = error as? APIError else {
            return "Misterious error \(error.localizedDescription)"
        }
        switch apiError {
        case .invalidURL:
            return "Invalid URL"
        case .networkError(_):
            return "Network Error"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Decoding Error"
        }
    }
}
