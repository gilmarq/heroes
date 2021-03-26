//
//  QuizViewModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 21/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class QuizViewModel {
    
    //MARK:- variables
    private let quizes: [(question: String, correctAnswer: String, options: [String])] = [
        (question: "Qual personagem mais famoso da Marvel?", correctAnswer: "Homem de Ferro",
         
         options: ["Homem de Ferro","Loki","Capitão america", "Homen aranha"]),
        (question: "Em qual personagem da DC foi inspirado Thanos?", correctAnswer: "Darkside",
         options: ["Darkside", "Batman",  "Apocalipse", "Omega Red"]),
        (question: "em que ano foi fudada a marvel comics?",correctAnswer:"1939",
         options: ["1940", "1935", "1970", "1939"]),
        (question: "Qual foi o primeiro filme da marvel studio?", correctAnswer: "Homem de Ferro",
         options: ["O Incrível Hulk", "Homem de Ferro", "homen aranha", "Quarteto fantatisco"]),
        (question: "Qual quadrinho mais vendido da historia da Mervel?", correctAnswer: "X-Men #1 (1991)",
         options: ["X-Men #1 (1991)", "Secret Wars #1 (2015)", "Amazing Spider-Man #1 (2014)", "Quarteto Fantastico #60 (2002)"]),
        (question: "Qual é maior bilheteria da marvel?", correctAnswer: "Avengers: ultimato",
         options: ["Guardiões da Galaxia", "Avengers: ultimato", "Homen aranha", "Capitão america"]),
        (question: "Quem foi o fundador da Marvel", correctAnswer:"Martin Goodman",
         options: ["Martin Goodman", "Stan Lee", "jack kirby", "Kevin Feige"]),
    ]
    
    private var quiz: QuizModel!
        
    private var _totalCorrecteAnswer = 0
    
    var questions: String {
        return quiz.question
    }
    var options: [String]{
        return quiz.options
    }
    var totalCorrecteAnswer: Int {
        return _totalCorrecteAnswer
    }
    
    //MARK:- methods
    func refreshQuiz() {
        let randomIndex = Int(arc4random_uniform(UInt32(quizes.count)));
        let quizData = quizes[randomIndex]
        quiz = QuizModel(question: quizData.question, options: quizData.options, correctAnswer: quizData.correctAnswer)
    }
    
    func validateAnswer(index: Int) {
        if quiz.vaidadOption(index) {
            _totalCorrecteAnswer += 1
        }
    }
}
