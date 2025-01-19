//
//  ViewController.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 10/01/25.
//

import UIKit

class NewsPageViewController: UIViewController {
    private var pageTitle: String
    private var posts: [Post]
    
    private let postsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init (pageTitle: String, posts: [Post]) {
        self.pageTitle = pageTitle
        self.posts = posts
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
    }
    
    //MARK: layout
    
    func setupViews() {
        postsTableView.backgroundColor = .clear
        self.view.addSubview(postsTableView)
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: Table View Methods
extension NewsPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        cell.fillContent(headlineLabel: posts[indexPath.row].headline,
                         contentTextView: posts[indexPath.row].content,
                         authorLabel: posts[indexPath.row].author)
        
        return cell
    }
}
