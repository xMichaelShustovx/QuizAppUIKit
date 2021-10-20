//
//  ViewController.swift
//  QuizApp
//
//  Created by Michael Shustov on 19.10.2021.
//

import UIKit

class ViewController: UIViewController, QuizProtocol, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set self as the data source and delegate of the table view
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set up the model
        model.delegate = self
        model.getQuestions()
    }
    
    // MARK: - QuizProtocol Methods
    
    func questionsRetrieved(_ questions: [Question]) {
        
        // Get a reference to the questions
        self.questions = questions
        
        // Reload the table view
        tableView.reloadData()
    }
    
    // MARK: - UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Make sure that questions array contains a question
        guard questions.count > 0  else {
            return 0
        }
        
        // Return the number of questions
        return questions[currentQuestionIndex].answers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        
        // Customize cell
        let label = cell.viewWithTag(1) as? UILabel
        
        if label != nil {
            
            // TODO: Set the answer text for the label
        }
        // Return cell
        return cell
    }
}

