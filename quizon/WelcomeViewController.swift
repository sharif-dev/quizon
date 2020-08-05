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
            Question(question: "How many planets are there in The Solar System?", answers: ["5", "6", "7", "8"], correct: 4),
            Question(question: "Which one is the radius of earth?", answers: ["6371", "5634", "2654", "9868"], correct: 1),
            Question(question: "What is the distance between earth and sun called?", answers: [ "1KM", "1AU", "1MI", "1DN"], correct: 2),
            Question(question: "Which of these planets is closer to the Sun than Earth?", answers: ["Jupiter", "Saturn", "Venus", "Mercury"], correct: 3),
            Question(question: "How many days does it take for Earth to travel around the Sun?", answers: ["415", "225", "365", "743"], correct: 3)
            ])
        case "Maths":
            quizController.quiz = Quiz(questions: [
            Question(question: "Whats is the result of 2 + 2 = ?", answers: ["3", "4", "5", "6"], correct: 2),
            Question(question: "What is the result of 4 x 5 = ?", answers: ["10", "15", "20", "25"], correct: 3),
            Question(question: "If any number is multiply with 0 then what will be answered?", answers: ["0", "1", "2", "The number itself"], correct: 1),
            Question(question: "What 2D shape has 3 sides", answers: ["Square", "Rectangle", "Circle", "Triangle"], correct: 4),
            Question(question: "What is the smallest two digit number?", answers: ["99", "80", "10", "20"], correct: 3),
            ])

        case "Physics":
            quizController.quiz = Quiz(questions: [
            Question(question: "What is an ohm measure?", answers: ["air resistance", "electrical resistance", "temperature of plasma", "volume of gas"], correct: 2),
            Question(question: "Which of these is NOT a state of matter?", answers: ["gas", "liquid", "solid", "they are all states of matter"], correct: 4),
            Question(question: "The ability of a substance to return to its shape after being deformed is called ______.", answers: ["elasticity", "flexibility", "metaflex", "integrity"], correct: 1),
            Question(question: "In nuclear physics, what is the opposite of fusion?", answers: ["stasis", "fission", "partition", "replication"], correct: 2),
            Question(question: "The upward force that water exerts on objects is called ________.", answers: ["buoyancy", "impermeability", "resistance", "water pressure"], correct: 1),
            ])

        default:
            fatalError("Unexpected Quiz: \(buttonText)")
        }
        
        
        // Pass the selected object to the new view controller.
    }

}
