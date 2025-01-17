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
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }


}

