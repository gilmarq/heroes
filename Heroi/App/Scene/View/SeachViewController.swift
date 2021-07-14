//
//  SeachViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 05/07/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SeachViewController: UIViewController {

    @IBOutlet weak var textFieldSaerch: UITextField!

    //MARk: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        setupTextField()
        setupNavBarBack()
    }

    //MARK: - action

    @IBAction func searchAction(_ sender: Any) {
        let coordinator = PreferredCoordinator(navigationController: navigationController!)
        coordinator.value = textFieldSaerch.text!
        coordinator.start()
    }

     //MARK: - method

   func setupTextField() {
         textFieldSaerch.layer.cornerRadius = 30
     }

    func setupNavBarBack() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}
