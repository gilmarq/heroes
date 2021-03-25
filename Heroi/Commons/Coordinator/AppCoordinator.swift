//
//  AppCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 22/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    private let navigationController: UINavigationController
    private var childCoordinator: QuizCoordinator!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let preLoginCoordinator = QuizCoordinator(
            navigationController: self.navigationController
        )
        
        self.childCoordinator = preLoginCoordinator
        self.childCoordinator.start()
    }
}
