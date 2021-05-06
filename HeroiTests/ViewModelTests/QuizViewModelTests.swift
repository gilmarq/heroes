//
//  QuizViewModelTests.swift
//  HeroiTests
//
//  Created by Gilmar Queiroz on 30/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import XCTest
@testable import Heroi

class QuizViewModelTests: XCTestCase {
    
    var viewModel: QuizViewModel?
  
    override func setUp() {
        viewModel =  QuizViewModel()
    }
    
    func testsQuizes() {
        XCTAssertNotNil(viewModel?.quizes)
        XCTAssertEqual(viewModel?.quizes.count, 7)
        XCTAssertEqual(viewModel?.quizes.first?.question, "Qual personagem mais famoso da Marvel?")
    }
    
    func testquestions() {
      // XCTAssertNil(viewModel?.quiz.options)
     
    
    }
}
