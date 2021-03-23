//
//  ShowHeroCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class ShowHeroCoordinator {
    
    // MARK: - Instance dependencies
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    private var viewController: ShowHeroViewController!
    
    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions
    func start() {
        self.viewController = ShowHeroViewController()
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
