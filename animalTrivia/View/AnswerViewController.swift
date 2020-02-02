//
//  AnswerViewController.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/25/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import UIKit

protocol QuestionViewDelegate: class {
    func prepareNextQuestion()
}

class AnswerViewController: UIViewController {
    
    // Added scoreLabel to track correct responses on the Navigation Bar
    // TODO: Update Score to reflect current value and then reset to zero
    // after every quiz.
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet weak var correctnessLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    weak var questionDelegate: QuestionViewDelegate?
    var answerIsCorrect: String = "Wrong"
    var explanation: String = ""
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        // QuestionVC prepares the next question
        self.questionDelegate?.prepareNextQuestion()
        
        // Dismiss the AnswerViewController 
        self.dismiss(animated: false) {
            print("Done!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    
    
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        correctnessLabel.text = answerIsCorrect
        if answerIsCorrect == "Correct" {
            scoreLabel.text = String(quizScore)
        }
        explanationLabel.text = explanation
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        correctnessLabel.text = ""
        explanationLabel.text = ""
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
