//
//  Question.swift
//  QuizApp
//
//  Created by Michael Shustov on 19.10.2021.
//

import Foundation

struct Question: Codable {
    
    var question: String?
    var answers: [String]?
    var correctAnswerIndex: Int?
    var feedback: String?
    
}
