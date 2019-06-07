//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Susan Zheng on 6/6/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation
import UIKit

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int{
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
    func openLink(indexPath: IndexPath){
        guard let url = URL(string: articles[indexPath.row].url) else { return }
        UIApplication.shared.open(url)
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    var title: String {
        return article.title
    }
    var description: String {
        return article.description
    }
    var url: String {
        return article.url
    }
    init(_ article: Article) {
        self.article = article
    }
}
