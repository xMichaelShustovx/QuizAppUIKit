//
//  QuizModel.swift
//  QuizApp
//
//  Created by Michael Shustov on 19.10.2021.
//

import Foundation

protocol QuizProtocol {
    
    func questionsRetrieved(_ questions: [Question])
}

class QuizModel {
    
    var delegate: QuizProtocol?
    
    func getQuestions() {
        
        // TODO: Fetch the questions
        
        // Notify the delegate of the retrieved questions
        delegate?.questionsRetrieved([Question]())
    }
}
