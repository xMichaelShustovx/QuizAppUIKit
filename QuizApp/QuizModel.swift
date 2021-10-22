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
        
        // Fetch the questions
        getRemoteJsonFile()
    }
    
    func getLocalJsonFile() {
        
        // Get bundle path for json file
        let bundlePath = Bundle.main.path(forResource: "QuestionData", ofType: "json")
        
        // Double check that path isn't nil
        guard bundlePath != nil else {
            print("Couldn't find the JSON data file")
            return
        }
        
        // Create URL object from the path
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Get the data from the url
        do {
            
            let data = try Data(contentsOf: url)
            
            // Decode the data
            let decoder = JSONDecoder()
            
            let questionData = try decoder.decode([Question].self, from: data)
            
            // Notify the delegate of the retrieved questions
            delegate?.questionsRetrieved(questionData)
            
        }
        catch {
            print("Couldn't convert url into data")
            print(error.localizedDescription)
        }
    }
    
    func getRemoteJsonFile() {
        
        // Get a URL object
        let urlString = "https://xmichaelshustovx.github.io/QuestionData/QuestionData.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create the URL object")
            return
        }
        
        // Get a URL session object
        let session = URLSession.shared
        
        // Get a data task object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Check an error
            if error == nil && data != nil {
                
                do {
                    
                    // Create a JSON Decoder object
                    let decoder = JSONDecoder()
                    
                    // Parse the JSON
                    let questionData = try decoder.decode([Question].self, from: data!)
                    
                    // Use the main thread to notify the view controller for UI work
                    DispatchQueue.main.async {
                        
                        // Notify the ViewController
                        self.delegate?.questionsRetrieved(questionData)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        // Call resume on the data task
        dataTask.resume()
    }
}
