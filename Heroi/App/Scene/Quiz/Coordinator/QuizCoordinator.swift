//
//  QuizCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 24/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class QuizCoordinator {

    var heros:Hero
    var value = ""
    
    private let navigationController: UINavigationController
    private var viewController: QuizViewController!
    
    init(navigationController: UINavigationController, heros: Hero) {
        self.heros = heros
        self.navigationController = navigationController
    }
    
    func start() {
        self.viewController = QuizViewController()
        self.viewController.heros = heros
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
