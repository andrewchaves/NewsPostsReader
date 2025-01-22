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
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .gray
        return label
    }()
    
    var contentTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .black
        textView.isUserInteractionEnabled = false
        textView.isScrollEnabled = false
        textView.layer.cornerRadius = 10.0
        textView.layer.shadowColor = UIColor.gray.cgColor
        textView.backgroundColor = .clear
        return textView
    }()
    
    var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10)
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
        self.backgroundColor = .clear
        self.selectionStyle = .none
        contentView.addSubview(headlineLabel)
        contentView.addSubview(contentTextView)
        contentView.addSubview(authorLabel)
       
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            headlineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            contentTextView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 16),
            contentTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            authorLabel.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            authorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
    }
    
    func fillContent( headlineLabel: String,
                      contentTextView: String,
                      authorLabel: String) {
        self.headlineLabel.text = headlineLabel
        self.contentTextView.text = contentTextView
        self.authorLabel.text = authorLabel
    }
}
