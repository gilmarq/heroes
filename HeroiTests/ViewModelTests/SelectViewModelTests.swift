//
//  SelectViewModelTests.swift
//  HeroiTests
//
//  Created by Gilmar Queiroz on 26/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import XCTest
@testable import Heroi

class SelectViewModelTests: XCTestCase {
    var viewModel: SelectViewModel?
    
    override func setUp() {
        viewModel = SelectViewModel()
    }
    
    func testFJson() {
        XCTAssertNil(viewModel?.select)
        viewModel?.formtJson()
        XCTAssertNotNil(viewModel?.select)
        XCTAssertEqual(viewModel?.select?.count, 3)
        XCTAssertEqual(viewModel?.select?.first?.text, "Filmes")
    
    }
    
    
}
