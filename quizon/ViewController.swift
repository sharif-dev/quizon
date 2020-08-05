//
//  ViewController.swift
//  quizon
//
//  Created by Allarious on 05/08/2020.
//  Copyright © 2020 Allarious. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var finishBarButton: UIBarButtonItem!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var timeToAnswer = 15
    var answerTimer =  Timer()
    
    var quiz = Quiz(questions: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = "time remaining: 15"
        answerTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? WelcomeViewController {
            
            print(sourceViewController.quiz)
            
        }
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer: Int = stackView.arrangedSubviews.firstIndex(of: sender)! - 2
        
        let correctness: Bool = quiz.checkAnswer(userAnswer: userAnswer)

        if correctness {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        let endOfQuiz = quiz.nextQuestion()
        
        if endOfQuiz{
            answerTimer.invalidate()
            
            UIApplication.shared.sendAction(finishBarButton.action ?? "", to: finishBarButton.target, from: self, for: nil)
        }

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func sth() {
        
    }
    
    @objc func countDown(){
        timeToAnswer -= 1
        timerLabel.text = "time remaining: \(timeToAnswer)"
        if timeToAnswer == 0{
            let _ = quiz.nextQuestion()
            updateUI()
        }
    }
    
    @objc func updateUI() {
        timeToAnswer = 15
        questionLabel.text = quiz.getQuestion()
        let buttonTexts = quiz.getAnswers()
        oneButton.setTitle(buttonTexts[0], for: .normal)
        twoButton.setTitle(buttonTexts[1], for: .normal)
        threeButton.setTitle(buttonTexts[2], for: .normal)
        fourButton.setTitle(buttonTexts[3], for: .normal)
        progressBar.progress = quiz.getProgress()
        scoreLabel.text = "Score: \(quiz.getScore())"

        oneButton.backgroundColor = UIColor.clear
        twoButton.backgroundColor = UIColor.clear
        threeButton.backgroundColor = UIColor.clear
        fourButton.backgroundColor = UIColor.clear
    }

}

