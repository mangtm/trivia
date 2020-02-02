//
//  QuestionViewController.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/22/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import UIKit
// Added
var quizScore = 0;

class QuestionViewController: UIViewController {

    var questionList = [Question]()
    var currentQuestionIndex = 0
    var answerVC: AnswerViewController?
  
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    @IBOutlet weak var answer4Label: UIButton!
    
    
    @IBAction func answer1Pressed(_ sender: UIButton) {
        
        if isSelectedAnswerCorrect(selectedAnswer: (sender.titleLabel?.text)!, correctAnswer: questionList[currentQuestionIndex-1].correctAnswer) {
            answer1Label.backgroundColor = UIColor.green
        
            self.presentViewControllerWith(Answer: "Correct!")
            quizScore += 1
        
        }
        else {
            answer1Label.backgroundColor = UIColor.red
            self.presentViewControllerWith(Answer: "Wrong!")
        }

    }
    
    func presentViewControllerWith(Answer: String) {
        
        guard let answerViewController = answerVC else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            answerViewController.answerIsCorrect = Answer
            answerViewController.explanation = self.questionList[self.currentQuestionIndex-1].explanation
            
            self.present(answerViewController, animated: true, completion: nil)
            
        }
        
    }
    
    // TODO: DRY the answer buttons
    @IBAction func answer2Pressed(_ sender: UIButton) {
        if isSelectedAnswerCorrect(selectedAnswer: (sender.titleLabel?.text)!, correctAnswer: questionList[currentQuestionIndex-1].correctAnswer) {
            answer2Label.backgroundColor = UIColor.green
            self.presentViewControllerWith(Answer: "Correct!")
            quizScore += 1
        }
        else {
            answer2Label.backgroundColor = UIColor.red
            self.presentViewControllerWith(Answer: "Wrong!")
        }
    }
    
    @IBAction func answer3Pressed(_ sender: UIButton) {
        if isSelectedAnswerCorrect(selectedAnswer: (sender.titleLabel?.text)!, correctAnswer: questionList[currentQuestionIndex-1].correctAnswer) {
            answer3Label.backgroundColor = UIColor.green
            self.presentViewControllerWith(Answer: "Correct!")
            quizScore += 1
        
        }
        else {
            answer3Label.backgroundColor = UIColor.red
            self.presentViewControllerWith(Answer: "Wrong!")
        }
    }
    
    @IBAction func answer4Pressed(_ sender: UIButton) {
        if isSelectedAnswerCorrect(selectedAnswer: (sender.titleLabel?.text)!, correctAnswer: questionList[currentQuestionIndex-1].correctAnswer) {
            answer4Label.backgroundColor = UIColor.green
            self.presentViewControllerWith(Answer: "Correct!")
            quizScore += 1
        
        
        }
        else {
            answer4Label.backgroundColor = UIColor.red
            self.presentViewControllerWith(Answer: "Wrong!")
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextsForNextQuestion()
        
        // Prepare answer view controller to be displayed upon user tap on the answer buttons
        answerVC = storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as? AnswerViewController
        answerVC?.questionDelegate = self
    }
    
    func isSelectedAnswerCorrect(selectedAnswer: String, correctAnswer: String) -> Bool {
        return selectedAnswer.lowercased() == correctAnswer.lowercased()
    }
    
    
    // TODO: Make this method more robust to take care of questions with variable number of answers
    func updateTextsForNextQuestion() {
        if currentQuestionIndex >= questionList.count {
            // TODO: Display end of the game view
            print("Index out of range")
            return
        }
        let currentQuestion = questionList[currentQuestionIndex]
        questionLabel.text = currentQuestion.question

        answer1Label.setTitle(currentQuestion.answers[0], for: .normal)
        answer2Label.setTitle(currentQuestion.answers[1], for: .normal)
        
        // Taking care of the case when there is only true or false options
        if currentQuestion.answers.count > 2 {
            answer3Label.setTitle(currentQuestion.answers[2], for: .normal)
            answer4Label.setTitle(currentQuestion.answers[3], for: .normal)
        }
        
        else {
            answer3Label.setTitle("", for: .normal)
            answer4Label.setTitle("", for: .normal)
        }

        currentQuestionIndex += 1
    }

}

// MARK - QuestionViewDelegate methods
extension QuestionViewController: QuestionViewDelegate {
    
    // Clear all the button background colors and display the next question from
    // question list
    func prepareNextQuestion() {
        
        self.answer1Label.backgroundColor = UIColor.clear
        self.answer2Label.backgroundColor = UIColor.systemOrange
        self.answer3Label.backgroundColor = UIColor.systemOrange
        self.answer4Label.backgroundColor = UIColor.clear
        updateTextsForNextQuestion()
    }
}
