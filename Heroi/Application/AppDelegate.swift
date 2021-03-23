//
//  AppDelegate.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 06/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //        let controller =  QuizViewController()
        //        window?.rootViewController = UINavigationController(rootViewController: controller)
        //        window?.makeKeyAndVisible()
        
        let navController = UINavigationController()
        window?.rootViewController = navController
        
        self.appCoordinator = AppCoordinator(navigationController: navController)
        self.appCoordinator.start()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

