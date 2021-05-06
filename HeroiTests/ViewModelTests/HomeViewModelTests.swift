//
//  HomeViewModelTests.swift
//  HeroiTests
//
//  Created by Gilmar Queiroz on 26/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import XCTest
@testable import Heroi

class HomeViewModelTests: XCTestCase {
    
    var universe:[HomeModelTests]?
    
    func testFormt(){
        universe = [HomeModelTests].formatJson("HomeMock") 
        XCTAssertNotNil(universe)
        XCTAssertEqual(universe?.count, 4)
        XCTAssertEqual(universe?.first?.image, "Marvel")
    }
    
}
