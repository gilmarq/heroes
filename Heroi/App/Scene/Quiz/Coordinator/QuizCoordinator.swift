//
//  QuizCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 24/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class QuizCoordinator {
    var value = ""
    
    // MARK: - Instance dependencies
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    private var viewController: QuizViewController!
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions
    func start() {
        self.viewController = QuizViewController()
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
