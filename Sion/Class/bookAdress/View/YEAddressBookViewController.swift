//
//  YEAddressBookViewController.swift
//  Sion
//
//  Created by leimo on 2019/12/20.
//  Copyright © 2019 leimo. All rights reserved.
//

import UIKit

class YEAddressBookViewController: RootViewController {
    /*
    var nameLabel: UILabel!
    var genderLabel: UILabel!
    var ageLabel: UILabel!
    var phoneLabel: UILabel!
    var emailLabel: UILabel!
    var line: UIView!
    */
    
//    var manager: ZSAddressBookManager?
    var tableView: UITableView!
    var errorEmptyView: UIView?
    private var articleListViewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        setUp()
        self.tableView.register(cellType: ArticleTableViewCell.self)
    }

    private func setUp() {
        NetWorkRequest(.getArticles(country: "cn", apiKey: "6c66b54db89a4c10a0bad853318da7e5"), hasLoading: false, completion: { (response) -> (Void) in
            do {
                
                let jsonData: [String: Any] = try response.mapJSON() as! [String : Any]
//                guard let data = jsonData["articles"] as? [String: Any] else { return }
                guard let model = ArticleList.deserialize(from: jsonData) else { return }
                self.articleListViewModel = ArticleListViewModel(articles: model.articles!)
                self.tableView.reloadData()
                
            } catch{
            }
        }) { (error) -> (Void) in
            
        }
    }

}
//MARK: - Private Methods For TableView
extension YEAddressBookViewController {
    
    private func setupTopBar() {
        
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }
    
    private func showErrorView() {
        errorEmptyView?.removeFromSuperview()
        
        errorEmptyView = UIView(frame: self.view.bounds)
        errorEmptyView?.backgroundColor = UIColor.red
        self.view.addSubview(errorEmptyView!)
    }
    
    private func hideErrorView() {
        errorEmptyView?.removeFromSuperview()
        errorEmptyView = nil
    }
}
//MARK: - UITableViewDelegate and UITableViewDataSource
extension YEAddressBookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articleListViewModel == nil ? 0 : articleListViewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListViewModel.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
//            fatalError("ArticleTableViewCell not found ")
//        }
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ArticleTableViewCell.self)
        let articleViewModel = articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel?.text = articleViewModel.title
        cell.descriptionLabel?.text = articleViewModel.description
        
        return cell
    }
    

}
