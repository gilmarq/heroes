//
//  HomeCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 22/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

 class HomeCoordinator {
    
    // MARK: - Instance dependencies
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    private var viewController: HomeViewController!
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions
    func start() {
        self.viewController = HomeViewController()
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
