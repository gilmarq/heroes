//
//  ShowHeroCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class ShowHeroCoordinator {
    
    var value = ""
    var imagemString = ""
    private let navigationController: UINavigationController
    private var viewController: ShowHeroViewController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.viewController = ShowHeroViewController()
        self.viewController.value = value
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
