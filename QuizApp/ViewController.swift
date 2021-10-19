//
//  ViewController.swift
//  QuizApp
//
//  Created by Michael Shustov on 19.10.2021.
//

import UIKit

class ViewController: UIViewController, QuizProtocol {

    let model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getQuestions()
    }
    
    // MARK: - QuizProtocol Methods
    func questionsRetrieved(_ questions: [Question]) {
        
        print("Questions retrieved from model!")
    }
}

