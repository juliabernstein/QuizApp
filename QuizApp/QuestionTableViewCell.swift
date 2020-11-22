//
//  QuestionTableViewCell.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/8/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    var answerLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        answerLabel = UILabel()
        answerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        answerLabel.textColor = .black
        answerLabel.numberOfLines = 0
        answerLabel.sizeToFit()
        answerLabel.preferredMaxLayoutWidth = 500
        answerLabel.textAlignment = .center
        
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(answerLabel)
        
            
        setupConstraints()
            
    }
        
        func setupConstraints() {
            
            let padding: CGFloat = 8

            
            NSLayoutConstraint.activate([
                answerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
                answerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                answerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                answerLabel.widthAnchor.constraint(equalToConstant: 400)
            ])
        }
    
    func configure(for answer: String) {
        
        answerLabel.text = answer
    }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
}

