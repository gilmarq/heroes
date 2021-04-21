//
//  ShowHeroViewControllerTests.swift
//  HeroiTests
//
//  Created by Gilmar Queiroz on 30/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import XCTest
@testable import Heroi

class ShowHeroViewControllerTests: XCTestCase {

    var controller: ShowHeroViewController!
    
    override func setUp() {
        controller = ShowHeroViewController()
    }
    
    func teste(){
        
        XCTAssertNotNil(controller.value)
        print(controller.value)
    
        //XCTAssertEqual(controller.value.count,3)
    
    }
    
    
}
