//
//  Article.swift
//  NewsApp
//
//  Created by Susan Zheng on 6/6/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import Foundation


struct ArticleList: Decodable{
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    let url: String
}
