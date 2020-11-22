//
//  QuestionVC.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/8/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit


class QuestionVC: UIViewController {
    
    var tableView: UITableView!
    
    let reuseIdentifier = "questionCellReuse"
    let cellHeight: CGFloat = 75
    var questionIndex: Int = 0
    var endpoint: String!
    var answerPossibilities: [String] = []
    var headerText: String = ""
    var score: Int = 0
    var finalPercent: Double = 0
    var category: String!
    
    
    init(rowIndex: Int, endpoint: String, category: String) {
        super.init(nibName: nil, bundle: nil)
        self.endpoint = endpoint
        self.category = category
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var questionList: [Question] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Initialize TableView
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // TableViewSetup
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        
        setupConstraints()
        getQuestions()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerText
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel:UILabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 390, height: self.tableView(tableView, heightForHeaderInSection: section)))
            headerLabel.numberOfLines = 0
            headerLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            headerLabel.text = headerText
            headerLabel.backgroundColor = .white
            headerLabel.textAlignment = .center
        
           return headerLabel;
    }
    
    
    func getQuestions() {
        NetworkManager.getQuestions(endpoint: endpoint) { questions in
            self.questionList = questions
            let currentQuestion = self.questionList[self.questionIndex]
            self.answerPossibilities.append(currentQuestion.correct_answer.base64Decoded()!)
            self.answerPossibilities.append(currentQuestion.incorrect_answers[0].base64Decoded()!)
            self.answerPossibilities.append(currentQuestion.incorrect_answers[1].base64Decoded()!)
            self.answerPossibilities.append(currentQuestion.incorrect_answers[2].base64Decoded()!)
            
            // randomization proccess
            
            self.answerPossibilities.shuffle()
            
            self.headerText = currentQuestion.question.base64Decoded()!
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}


extension QuestionVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerPossibilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as!QuestionTableViewCell
        
        cell.configure(for: answerPossibilities[indexPath.row])
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastQuestion = questionList[questionIndex]
        tableView.backgroundColor = (lastQuestion.correct_answer.base64Decoded() == answerPossibilities[indexPath.row]) ? UIColor.green.withAlphaComponent(0.3) : UIColor.red.withAlphaComponent(0.5)
        if lastQuestion.correct_answer.base64Decoded() == answerPossibilities[indexPath.row] {
            score = score + 1
        }
        
        if (questionIndex<9) {
            questionIndex = questionIndex + 1
            let currentQuestion = questionList[questionIndex]
            answerPossibilities.removeAll()
            answerPossibilities.append(currentQuestion.correct_answer.base64Decoded()!)
            answerPossibilities.append(currentQuestion.incorrect_answers[0].base64Decoded()!)
            answerPossibilities.append(currentQuestion.incorrect_answers[1].base64Decoded()!)
            answerPossibilities.append(currentQuestion.incorrect_answers[2].base64Decoded()!)
            headerText = currentQuestion.question.base64Decoded()!
            
            // randomization
            answerPossibilities.shuffle()
            
            
            tableView.reloadData()
        }
        else if (questionIndex == 9) {
            finalPercent = ((Double)(score)/10.0)*100.0
            let scorePageVC = ScorePageVC(score: finalPercent, category: category)
            navigationController?.pushViewController(scorePageVC, animated: true)
        }
    } // end if
    
}

extension QuestionVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellHeight
    }
}
