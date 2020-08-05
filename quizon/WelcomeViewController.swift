//
//  WelcomeViewController.swift
//  quizon
//
//  Created by Allarious on 05/08/2020.
//  Copyright © 2020 Allarious. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var quiz = "hasdugasildufhisudhfiushdfiuasdfello"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let quizController = segue.destination as? ViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedQuiz = sender as? UIButton else {
            fatalError("Unexpected sender: \(sender)")
        }
        
        let buttonText = selectedQuiz.titleLabel?.text
        
        switch(buttonText){
        case "Astronomy":
            quizController.quiz = Quiz(questions: [
            Question(question: "Astronomy1", answers: ["A", "B", "C", "D"], correct: 2),
            Question(question: "Astronomy2", answers: ["A", "B", "C", "D"], correct: 2),
            Question(question: "Astronomy3", answers: ["A", "B", "C", "D"], correct: 2),
            Question(question: "Astronomy4", answers: ["A", "B", "C", "D"], correct: 2),
            Question(question: "Astronomy5", answers: ["A", "B", "C", "D"], correct: 2),
            ])
        case "Maths":
            quizController.quiz = Quiz(questions: [
            Question(question: "Maths1", answers: ["L", "M", "N", "O"], correct: 2),
            Question(question: "Maths2", answers: ["L", "M", "N", "O"], correct: 2),
            Question(question: "Maths3", answers: ["L", "M", "N", "O"], correct: 2),
            Question(question: "Maths4", answers: ["L", "M", "N", "O"], correct: 2),
            Question(question: "Maths5", answers: ["L", "M", "N", "O"], correct: 2),
            ])

        case "Physics":
            quizController.quiz = Quiz(questions: [
            Question(question: "Physics1", answers: ["P", "Q", "R", "S"], correct: 2),
            Question(question: "Physics2", answers: ["P", "Q", "R", "S"], correct: 2),
            Question(question: "Physics3", answers: ["P", "Q", "R", "S"], correct: 2),
            Question(question: "Physics4", answers: ["P", "Q", "R", "S"], correct: 2),
            Question(question: "Physics5", answers: ["P", "Q", "R", "S"], correct: 2),
            ])

        default:
            fatalError("Unexpected Quiz: \(buttonText)")
        }
        
        
        // Pass the selected object to the new view controller.
    }

}
