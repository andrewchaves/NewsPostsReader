//
//  ViewController.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//

import UIKit

class NewsPageViewController: UIViewController {
    
    private var pageTitle: String
    
    init (pageTitle: String) {
        self.pageTitle = pageTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        
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

