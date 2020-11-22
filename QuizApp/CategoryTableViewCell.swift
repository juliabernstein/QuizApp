//
//  CategoryTableViewCell.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/7/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    var categoryLabel: UILabel!
    
    let col1 = UIColor(red: 0.149, green: 0.0784, blue: 0.6078, alpha: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        categoryLabel = UILabel()
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 25)
        categoryLabel.textColor = col1
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        
        setupConstraints()
        
}
    
    func setupConstraints() {
        
        let padding: CGFloat = 8
        let labelHeight: CGFloat = 40
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
    }
    
    func configure(for category: String) {
        categoryLabel.text = category
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
