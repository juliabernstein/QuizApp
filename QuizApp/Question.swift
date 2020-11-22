//
//  Question.swift
//  QuizApp
//
//  Created by Julia Bernstein on 5/7/20.
//  Copyright © 2020 Julia Bernstein. All rights reserved.
//

import Foundation

struct Question: Codable {
    var category: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
    
}

struct ResultsObject: Codable {
    var results: [Question]
    var response_code: Int
}

