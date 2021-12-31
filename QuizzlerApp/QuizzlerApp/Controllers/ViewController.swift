//
//  ViewController.swift
//  QuizzlerApp
//
//  Created by sky on 12/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    private var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateUI()
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        // Set background color for answer buttons
        answerButton1.backgroundColor = UIColor.clear
        answerButton2.backgroundColor = UIColor.clear
        answerButton3.backgroundColor = UIColor.clear
        
        // Set text for answer buttons
        answerButton1.setTitle(quizBrain.getAnswer(buttonNumber: 0), for: .normal)
        answerButton2.setTitle(quizBrain.getAnswer(buttonNumber: 1), for: .normal)
        answerButton3.setTitle(quizBrain.getAnswer(buttonNumber: 2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}

