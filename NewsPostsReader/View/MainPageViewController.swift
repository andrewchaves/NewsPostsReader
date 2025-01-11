//
//  ViewController.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        let api = Service()
        
        Task {
            do {
                let posts: [Post] = try await api.makeRequest(endpoint: "posts", method: .GET, responseType: [Post].self)
                print("Result: \(posts)")
            }catch let error as APIError {
                switch error {
                    
                case .invalidURL:
                    print("Invalid URL")
                case .networkError(_):
                    print("Network Error")
                case .invalidResponse:
                    print("Invalid Response")
                case .decodingError:
                    print("Decoding Error")
                }
            } catch {
                print("Misterious Error")
            }
        }
    }


}

