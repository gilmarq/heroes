//
//  LoginCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/04/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class LoginCoordinator {
    var value = ""

    // MARK: - Instance dependencies
    private let navigationController: UINavigationController

    // MARK: - Instance state
    private var viewController: LoginViewController!

    // MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator functions
    func start() {
        self.viewController = LoginViewController()
       // self.viewController.value = value
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
