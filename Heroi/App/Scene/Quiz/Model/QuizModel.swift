//
//  QuizModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 21/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class QuizModel {
    
    let question: String
    let options: [String]
    
    private let correcteAnswer: String
    
    init(question: String, options:[String],correcteAnswer:String ) {
        self.question = question
        self.options = options
        self.correcteAnswer = correcteAnswer
    }
    
    deinit {
        print("Liberou o quiz da memória")
    }
    
    func vaidadOption(_ index: Int) -> Bool{
        let answer = options[index]
        return answer == correcteAnswer
    }
    
    
}
