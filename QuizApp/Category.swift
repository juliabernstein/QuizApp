//
//  Category.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/8/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import Foundation

class Category {

    var categoryName: String
    var categoryEndpoint: String

    init(categoryName: String, categoryEndpoint: String) {
        self.categoryName = categoryName
        self.categoryEndpoint = categoryEndpoint
    }

}
