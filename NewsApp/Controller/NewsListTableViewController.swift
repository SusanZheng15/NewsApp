//
//  ViewController.swift
//  NewsApp
//
//  Created by Susan Zheng on 6/6/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    private var articleListViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setUpTableView()
        getData()
    }

    private func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "News"
    }

    private func setUpTableView(){
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier.articleTableViewCell)
    }
    
    private func getData(){
        APIClient.shared.getResult {[weak self] result in
            DispatchQueue.main.async(execute: {
                switch result {
                case .success(let article):
                    self?.articleListViewModel = ArticleListViewModel(articles: article.articles)
                    self?.tableView.reloadData()
                    break
                case .clientError:
                    AppUtility.shared.handleAPIResultError(result)
                    break
                case .noInternetConnection:
                    AppUtility.shared.handleAPIResultError(result)
                    break
                default:
                    AppUtility.shared.handleAPIResultError(result)
                    break
                }
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel?.numberOfRowInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier.articleTableViewCell, for: indexPath) as? ArticleTableViewCell else {return UITableViewCell.init()}
        if let articleVM = self.articleListViewModel?.articleAtIndex(indexPath.row){
            cell.setArticleDisplay(articleVM)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height / 6
    }
}

