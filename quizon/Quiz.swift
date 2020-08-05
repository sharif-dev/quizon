//
//  quiz.swift
//  quizon
//
//  Created by Allarious on 05/08/2020.
//  Copyright © 2020 Allarious. All rights reserved.
//

import Foundation

class Quiz{
    
    let questions : [Question]
    var currentQuestion : Int
    var score : Int
    
    init(questions: [Question]) {
        self.questions = questions
        currentQuestion = 0
        score = 0
    }
    
    func getQuestion() -> String {
        return questions[currentQuestion].text
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion) / Float(questions.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    func nextQuestion() -> Bool {
        if currentQuestion + 1 < questions.count{
            currentQuestion += 1
            return false
        }
        
        return true
    }
    
    func getAnswers() -> [String] {
        return questions[currentQuestion].answers
    }
    
    func checkAnswer(userAnswer: Int) -> Bool {
        if userAnswer == questions[currentQuestion].correct{
            score += 1
            return true
        }
        
        return false
    }
}
