//
//  AppDelegate.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 06/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    var appCoordinator: AppCoordinator!
    let navController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        navController.navigationBar.backItem?.title = " "
        window?.rootViewController = navController
        
        self.appCoordinator = AppCoordinator(navigationController: navController)
        
        self.appCoordinator.start()

        FirebaseApp.configure()

        window?.makeKeyAndVisible()

        
        
        return true
    }
}

