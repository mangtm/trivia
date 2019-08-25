//
//  QuestionViewController.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/22/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var questionList = [Question]()
    var currentQuestionIndex = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Label: UIButton!
    @IBOutlet weak var answer2Label: UIButton!
    @IBOutlet weak var answer3Label: UIButton!
    @IBOutlet weak var answer4Label: UIButton!
    
    
    @IBAction func answer1Pressed(_ sender: UIButton) {
        updateTextsForNextQuestion()
    }
    
    @IBAction func answer2Pressed(_ sender: UIButton) {
        updateTextsForNextQuestion()
    }
    
    @IBAction func answer3Pressed(_ sender: UIButton) {
        updateTextsForNextQuestion()
    }
    
    @IBAction func answer4Pressed(_ sender: UIButton) {
        updateTextsForNextQuestion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(questionList)
        updateTextsForNextQuestion()
        
    }
    
    func updateTextsForNextQuestion() {
        if currentQuestionIndex >= questionList.count {
            return
        }
        var currentQuestion = questionList[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        answer1Label.setTitle(currentQuestion.answers[0], for: .normal)
        answer2Label.setTitle(currentQuestion.answers[1], for: .normal)
        answer3Label.setTitle(currentQuestion.answers[2], for: .normal)
        answer4Label.setTitle(currentQuestion.answers[3], for: .normal)
        currentQuestionIndex += 1
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
