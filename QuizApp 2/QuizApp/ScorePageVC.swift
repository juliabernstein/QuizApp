//
//  ScorePageVC.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/8/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class ScorePageVC: UIViewController {
    
    var scoreText: UITextView!
    var nameLabel: UITextField!
    var saveButton: UIButton!
    var nameText: UITextView!
    var score: Double = 0.0
    var category: String = ""
    var scoreToSave: String = ""
    
    
    init(score: Double, category: String) {
        super.init(nibName: nil, bundle: nil)
        self.score = score
        self.category = category
        self.scoreToSave = "\(score)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let scoreString = "Score: \(score)%"
        
        scoreText = UITextView()
        scoreText.text = scoreString
        print(scoreString)
        scoreText.textColor = .black
        scoreText.font = .boldSystemFont(ofSize: 30)
        scoreText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scoreText)
        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        nameLabel = UITextField()
        nameLabel.textColor = .black
        nameLabel.borderStyle = .roundedRect
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        nameText = UITextView()
        nameText.text = "Name:"
        nameText.font = .boldSystemFont(ofSize: 15)
        nameText.textColor = .black
        nameText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameText)
        
        saveButton.addTarget(self, action: #selector(saveScore), for: .touchUpInside)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            scoreText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            scoreText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            scoreText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreText.widthAnchor.constraint(equalToConstant: 150),
            scoreText.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            scoreText.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: scoreText.bottomAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameText.topAnchor.constraint(equalTo: scoreText.bottomAnchor, constant: 10),
            nameText.heightAnchor.constraint(equalToConstant: 30),
            nameText.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -5),
            nameText.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            saveButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])


    }
    
    
    @objc func saveScore() {
        
        if nameLabel.text == "" {
            let alert2 = UIAlertController(title: "Error", message: "Please type a name", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert2, animated: true, completion: nil)
        }
        let savedScoresVC = SavedScoresVC(name: nameLabel.text!, category: category, score: score)
        navigationController?.pushViewController(savedScoresVC, animated: true)
    }

}
