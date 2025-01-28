//
//  ViewController.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//

import UIKit
import Foundation

class NewsPageViewController: UIViewController {
    private var pageTitle: String
    private var posts: [Post]
    private var category: Category?
    private var categorizidedPosts: [Post] = []
    
    private let postsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init (pageTitle: String, posts: [Post], category: Category? = nil) {
        self.pageTitle = pageTitle
        self.posts = posts
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pageTitle
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupViews()
        generateCategorizedPosts()
    }
    
    //MARK: layout
    
    func setupViews() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.orange
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 42, weight: .bold)
        ]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(postsTableView)
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = 120
        postsTableView.separatorStyle = .none
        postsTableView.backgroundColor = .clear
        postsTableView.showsVerticalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func generateCategorizedPosts() {
        guard let _ = self.category else {
            categorizidedPosts = posts
            return
        }
        posts.forEach { post in
            if post.category == self.category {
                categorizidedPosts.append(post)
            }
        }
        postsTableView.reloadData()
    }
}

//MARK: Table View Methods
extension NewsPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categorizidedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.fillContent(headlineLabel: categorizidedPosts[indexPath.row].headline,
                         contentTextView: categorizidedPosts[indexPath.row].content,
                         authorLabel: categorizidedPosts[indexPath.row].author)
        
        return cell
    }
}
