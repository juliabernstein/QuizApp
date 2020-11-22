//
//  ViewController.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/7/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    let reuseIdentifier = "categoryCellReuse"
    let cellHeight: CGFloat = 65
    var categories: [Category]!
    
    
    let generalKnowledge = Category(categoryName: "General Knowledge", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple&encode=base64")
    let books = Category(categoryName: "Books", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=10&difficulty=medium&type=multiple&encode=base64")
    let film = Category(categoryName: "Film", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=11&difficulty=medium&type=multiple&encode=base64")
    let music = Category(categoryName: "Music", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=12&difficulty=medium&type=multiple&encode=base64")
    let television = Category(categoryName: "Television", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=14&difficulty=medium&type=multiple&encode=base64")
    let sports = Category(categoryName: "Sports", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=21&difficulty=medium&type=multiple&encode=base64")
    let history = Category(categoryName: "History", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=23&difficulty=medium&type=multiple&encode=base64")
    let science = Category(categoryName: "Science and Nature", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=17&difficulty=medium&type=multiple&encode=base64")
    let geography = Category(categoryName: "Geography", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=22&difficulty=medium&type=multiple&encode=base64")
    let celebrities = Category(categoryName: "Celebrities", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=26&difficulty=medium&type=multiple&encode=base64")
     let politics = Category(categoryName: "Politics", categoryEndpoint: "https://opentdb.com/api.php?amount=10&category=24&difficulty=medium&type=multiple&encode=base64")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let col1 = UIColor(red: 0.0314, green: 0.0157, blue: 0.9686, alpha: 1)
        
        title = "Categories"
        view.backgroundColor = col1
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.backgroundColor = col1
        categories = [generalKnowledge, books, film, music, television, sports, history, science, geography, celebrities, politics]
        
        // Initialize TableView
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // TableViewSetup
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)

        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionVC = QuestionVC(rowIndex: indexPath.row, endpoint: categories[indexPath.row].categoryEndpoint, category: categories[indexPath.row].categoryName)
        navigationController?.pushViewController(questionVC, animated: true)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as!CategoryTableViewCell
        let category = categories[indexPath.row].categoryName
        cell.selectionStyle = .none
        cell.configure(for: category)
        
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

