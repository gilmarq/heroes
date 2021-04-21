//
//  PreferredViewModelTests.swift
//  HeroiTests
//
//  Created by Gilmar Queiroz on 29/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import XCTest
@testable import Heroi

class PreferredViewModelTests: XCTestCase {
    
    var viewModel: PreferredViewModel?
    var preferre: [PreferredModal]?
    
    override func setUp() {
        viewModel = PreferredViewModel()
    }

    func testFTJson() {

        XCTAssertNotNil(viewModel?.preferre)
        XCTAssertEqual(viewModel?.preferre.count, 4)
        XCTAssertEqual(viewModel?.preferre.first?.logo, "ironMan")
    }
}
