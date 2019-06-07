//
//  ViewController.swift
//  NewsApp
//
//  Created by Susan Zheng on 6/6/19.
//  Copyright © 2019 Susan Zheng. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        APIClient.shared.getResult { (result) in
            DispatchQueue.main.async(execute: {
                print(result)
            })
        }
    }

    private func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "News"
    }

}

