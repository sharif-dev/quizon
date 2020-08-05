//
//  Question.swift
//  quizon
//
//  Created by Allarious on 05/08/2020.
//  Copyright © 2020 Allarious. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correct: Int
    
    init(question: String, answers: [String], correct: Int) {
        self.text = question
        self.answers = answers
        self.correct = correct
    }
}
