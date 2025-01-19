//
//  PostCell.swift
//  NewsPostsReader
//
//  Created by Andrew Vale on 18/01/25.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var headlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .gray
        return label
    }()
    
    var postContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
        return view
    }()
    
    var contentTextView: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 22)
        textField.textColor = .black
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Cell configuration
    
    func setupViews() {
        contentView.backgroundColor = .clear
        contentView.addSubview(headlineLabel)
        postContentView.addSubview(contentTextView)
        contentView.addSubview(postContentView)
        contentView.addSubview(authorLabel)
    }
    
    func fillContent( headlineLabel: String,
                      contentTextView: String,
                      authorLabel: String) {
        self.headlineLabel.text = headlineLabel
        self.contentTextView.text = contentTextView
        self.authorLabel.text = authorLabel
    }
}
