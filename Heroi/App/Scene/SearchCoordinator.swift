//
//  SearchCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 05/07/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SearchCoordinator {
   // MARK: - Instance dependencies
       private let navigationController: UINavigationController

       // MARK: - Instance state
       private var viewController: SeachViewController!

       // MARK: - Initializers
       init(navigationController: UINavigationController) {
           self.navigationController = navigationController
       }

       // MARK: - Coordinator functions
       func start() {
           self.viewController = SeachViewController()
           self.navigationController.pushViewController(self.viewController, animated: false)
       }
}
