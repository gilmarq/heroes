//
//  PreloginCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

final class PreLoginCoordinator {
    
    // MARK: - Instance dependencies
    
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    
    private var viewController: PreLoginViewController!
    
    // MARK: - Initializers
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions
    func start() {
        let controller  = PreLoginViewController()
        self.navigationController.pushViewController(controller, animated: true)
    }
}

