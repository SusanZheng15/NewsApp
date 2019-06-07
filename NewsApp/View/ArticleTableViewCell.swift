//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Susan Zheng on 6/6/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Medium", size: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "AvenirNext-Regular", size: 11)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubViews()
        titleLabel.sizeToFit()
        descriptionLabel.sizeToFit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubViews(){
        selectionStyle = .none
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(articleImageView)
        articleImageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        articleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        articleImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        articleImageView.widthAnchor.constraint(equalTo: articleImageView.heightAnchor).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
    }
    
    func setArticleDisplay(_ article: ArticleViewModel){
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        if let url = article.articleImageURL{
            articleImageView.sd_setImage(with: url)
        }
    }
}
