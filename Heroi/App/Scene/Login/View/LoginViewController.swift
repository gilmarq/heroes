//
//  LoginViewController.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 19/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - outlet
    
    @IBOutlet weak var msgError: UILabel!
    @IBOutlet private weak var passWord: UITextField! {
        didSet{
            passWord.setLefPass(image: UIImage(named:"key") ?? UIImage())
            passWord.tintColor = .darkGray
            passWord.isSecureTextEntry = true
        }
    }
    
    @IBOutlet private weak var eMail: UITextField! {
        didSet{
            eMail.setLef(image: UIImage(named:"user") ?? UIImage())
            eMail.tintColor = .darkGray
            eMail.isSecureTextEntry = false
        }
    }
    
    // MARK: - cyclo view
    override func viewDidLoad() {
        super.viewDidLoad()
        msgError.isHidden = true 
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - init
    init() {
        super.init(nibName: "LoginView", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func actionButton(_ sender: Any) {
        let coordinator =  HomeCoordinator(navigationController: navigationController!)
        coordinator.start()
        
        

        
        //self.navigationController?.pushViewController(HomeViewController(), animated: true)
    }
}
