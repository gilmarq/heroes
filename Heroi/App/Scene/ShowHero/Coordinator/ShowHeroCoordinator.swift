//
//  ShowHeroCoordinator.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class ShowHeroCoordinator {

    var heros:Hero
    var value: Int = 0
    var imagemString = ""
    private let navigationController: UINavigationController
    private var viewController: ShowHeroViewController!
    
    init(navigationController: UINavigationController, heros: Hero) {
        self.heros = heros
        self.navigationController = navigationController
    }
    
    func start() {
        self.viewController = ShowHeroViewController()
        self.viewController.totalCorrectAnswer = value
        self.viewController.heros = heros
        self.navigationController.pushViewController(self.viewController, animated: false)
    }
}
