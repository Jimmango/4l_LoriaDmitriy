//
//  ViewController.swift
//  AppTest
//
//  Created by Dima Loria on 07.05.2020.
//  Copyright © 2020 Dima Loria. All rights reserved.
//

import UIKit

let reuseIdentifier = "NewsCell"


class MainViewController: UIViewController {
    
    var selectedIndexPath: IndexPath? = nil

    var news: NewsAPI? = nil
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)


    // MARK: - Properties
    
    var showMenu = false

    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationItem.title = "BBC News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .systemPink
        
        fetchData()
        
        configureTableView()
    }
    
    // MARK: - Helper Functions
    
    func configureTableView() {

        view.addSubview(tableView)
        tableView.register(NewsCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // Из-за этого не показывался Хеддер
        tableView.delegate = self
        
        tableView.showsVerticalScrollIndicator = false
        updateLayout(with: self.view.frame.size)
    }
    
    
    

    
    // MARK: - Selectors
    @objc func handleArticle(button: UIButton) {

        let section = button.tag
        
        
        guard  let news = news else {return}
        var indexPathsToReload = [IndexPath]()
        
        for section in news.articles.indices {
                let indexPath = IndexPath(row: 1, section: section)
                indexPathsToReload.append(indexPath)
        }
        
        
        
        button.isSelected = !button.isSelected
        self.news?.isExtended = button.isSelected
        
        
        
        var indexPaths = [IndexPath]()
        
//        for (section, value) in news.articles.enumerated() {
//            print(section, value)
            
            news.articles.forEach { (article) in
                let indexPath = IndexPath(row: 1, section: section)
                indexPaths.append(indexPath)
            }
            
//            let indexPath = IndexPath(row: index, section: section)
//            indexPaths.append(indexPath)

        
        if button.isSelected {
            print ("on")
            tableView.insertRows(at: indexPaths, with: .fade)
        } else {
            print ("off")
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
        
    }

    // MARK: - API
    
    func fetchData() {
        let urlString = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=3d41199b60864a4e851167cf4c64cff8"
        
        NewsFeed.shared.request(urlString: urlString) { [weak self] (result) in
            switch result {
            case .success(let news):
                self?.news = news
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
    
    // MARK: - UITableViewDelegate/DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let articleSection = news?.articles[section].title
        let button = UIButton(type: .system)
        button.setTitle("\(articleSection ?? "Fail" )", for: .normal)
               button.setTitleColor(.black, for: .normal)
               button.backgroundColor = .yellow
               button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
               
               button.addTarget(self, action: #selector(handleArticle), for: .touchUpInside)
               
               button.tag = section
               
               return button
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let newsSection = news?.articles.count else { return 0 }
        return newsSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news?.articles[section].description?.count else { return 0 }
        
        if self.news?.isExtended == true {
            return 1
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsCell
//        let articleSection = news?.articles[indexPath.row].title
        let articleRow = news?.articles[indexPath.section].description
        
//        cell.titleLabel.text = articleSection
        cell.titleLabel.numberOfLines = 0
        cell.descriptionLabel.text = articleRow
        cell.descriptionLabel.numberOfLines = 0

//        cell.descriptionLabel.isHidden = true
        cell.selectionStyle = .none
//        cell.animateMenu(shouldExpand: true)

        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//

        
//        guard let cell = tableView.cellForRow(at: indexPath) as? NewsCell else { return }
//
//
//
//        if showMenu {
//
//            tableView.insertRows(at: [indexPath], with: .fade)
//        } else {
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
        
//        var articleRow = news!.articles[indexPath.row].description
        
//        if indexPath.row != indexPath.row {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        
//        print(indexPath.row)
//        print(tableView.indexPathsForSelectedRows)

        
        
//        if selectedIndexPath == indexPath {
//            // it was already selected
//            selectedIndexPath = nil
//            tableView.deselectRow(at: indexPath, animated: false)
//            print(2)
//        } else {
//            // wasn't yet selected, so let's remember it
//            selectedIndexPath = indexPath
//            print(1)
//        }
//
//        if let indexPath = tableView.indexPathForSelectedRow {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        

        
//        for row in news.articles.indices {
//            print (0, row)
//        }
        
//        for (index, value) in news.articles.enumerated() {
//            print (index, value)
//        }
        
//        if  cell.descriptionLabel.isHidden == true {
//            cell.descriptionLabel.isHidden = false
//        } else {
//            cell.descriptionLabel.isHidden = true
//        }
//        tableView.beginUpdates()
//        tableView.endUpdates()
//    }
}

	
