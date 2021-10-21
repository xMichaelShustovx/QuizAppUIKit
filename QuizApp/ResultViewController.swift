//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Michael Shustov on 21.10.2021.
//

import UIKit

protocol ResultViewControllerProtocol {
    func dialogDismissed()
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var dimView: UIView!
    
    @IBOutlet weak var dialogView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    var titleText = ""
    var feedbackText = ""
    var buttonText = ""
    
    var delegate: ResultViewControllerProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Round the dialog box corners
        dialogView.layer.cornerRadius = 10

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Now as elements are loaded, set the text
        titleLabel.text = titleText
        feedbackLabel.text = feedbackText
        dismissButton.setTitle(buttonText, for: .normal)
        
    }

    @IBAction func dismissTapped(_ sender: Any) {
        
        // Dismiss the popup
        self.dismiss(animated: true, completion: nil)
        
        delegate?.dialogDismissed()
    }
    
}
