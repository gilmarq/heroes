//
//  SelectCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectCoordinator {

    var image: UIImageView!
    var heros:Hero

    
    // MARK: - Instance dependencies
    private let navigationController: UINavigationController
    
    // MARK: - Instance state
    private var viewController: SelectViewController!
    
    // MARK: - Initializers
    init(navigationController: UINavigationController , heros: Hero) {
        self.heros = heros
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator functions
    func start() {
        self.viewController = SelectViewController()

        self.viewController.heros = heros
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
