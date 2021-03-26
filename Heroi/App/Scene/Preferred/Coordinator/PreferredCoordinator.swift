//
//  PreferredCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class PreferredCoordinator {
    
    var value = ""
    private let navigationController: UINavigationController
    private var viewController: PreferredViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.viewController = PreferredViewController()
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
