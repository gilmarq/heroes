//
//  PreLoginViewController.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 18/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class PreLoginViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    init() {
        super.init(nibName: "PreLoginView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func actionButto(_ sender: Any) {
         let controller = LoginViewController()
        self.navigationController?.pushViewController(controller, animated:true)
    }
}
