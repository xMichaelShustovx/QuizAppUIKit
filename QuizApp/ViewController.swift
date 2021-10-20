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
    var numCorrect = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set self as the data source and delegate of the table view
        tableView.dataSource = self
        tableView.delegate = self
        
        // Dynamic row heights
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Set up the model
        model.delegate = self
        model.getQuestions()
    }
    
    func displayQuestion() {
        
        // Check if there are questions and check that the currentQuestionIndex is not out of bounds
        guard questions.count > 0 && currentQuestionIndex < questions.count else {
            return
        }
        
        // Display the question text
        questionLabel.text = questions[currentQuestionIndex].question
        
        
        // Reload the table view
        tableView.reloadData()
    }
    
    // MARK: - QuizProtocol Methods
    
    func questionsRetrieved(_ questions: [Question]) {
        
        // Get a reference to the questions
        self.questions = questions
        
        // Display the first question
        displayQuestion()

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
            
            let question = questions[currentQuestionIndex]
            
            
            if question.answers != nil &&
                indexPath.row < question.answers!.count {
             
                // Set the answer text for the label
                label!.text = question.answers![indexPath.row]
            }
        }
        // Return cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has tapped on the row, check if it's a right answer
        if indexPath.row == questions[currentQuestionIndex].correctAnswerIndex {
            
            // User got it right
            
        }
        else {
            // User got it wrong
            
        }
        
        // Increment the current question index
        currentQuestionIndex += 1
        
        // Display the next question
        displayQuestion()
        
    }
}

