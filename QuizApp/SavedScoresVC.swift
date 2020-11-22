//
//  SavedScoresVC.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/9/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class SavedScoresVC: UIViewController {
    
    var category: String = ""
    var name: String = ""
    var score: Double = 0.0
    let userDefaults = UserDefaults.standard
    var scoreList: UITextView!
    var quitButton: UIButton!
    
    init(name: String, category: String, score: Double) {
        super.init(nibName: nil, bundle: nil)
        self.name = name
        self.category = category
        self.score = score
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        self.title = "Score Board"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        scoreList = UITextView()
        scoreList.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        scoreList.textColor = .black
        scoreList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreList)
        
        quitButton = UIButton()
        quitButton.setTitle("Quit and play again", for: .normal)
        quitButton.backgroundColor = .white
        quitButton.translatesAutoresizingMaskIntoConstraints = false
        quitButton.setTitleColor(.black, for: .normal)
        quitButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(quitButton)
        
        setupConstraints()
        addScore()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scoreList.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            scoreList.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreList.widthAnchor.constraint(equalToConstant: 400),
            scoreList.heightAnchor.constraint(equalToConstant: 700)
        ])
        
        NSLayoutConstraint.activate([
            quitButton.topAnchor.constraint(equalTo: scoreList.bottomAnchor, constant: 10),
            quitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    func addScore() {
//        uncomment this if you want to clear dictionary
//        UserDefaults.standard.set([String](), forKey: "savedStringArray")
        
        
        var strings = UserDefaults.standard.array(forKey: "savedStringArray") as! [String]
        strings.append("Name:  \(name) | Score: \(score) | Category: \(category)")
        UserDefaults.standard.set(strings, forKey: "savedStringArray")
        let tableData = userDefaults.value(forKey: "savedStringArray") as? [String]
        let dataString = tableData?.joined(separator: "\n\n")
        scoreList.text = dataString
    }
    
    @objc func dismissViewController() {
       self.navigationController?.popToRootViewController(animated: true)
    }
}
    
