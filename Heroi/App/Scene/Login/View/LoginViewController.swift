//
//  LoginViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 23/04/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    var email = ""
    var password = ""

    //MARK: - IBOutlet
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var msgError: UILabel!

    //MARK: - variable

    weak var timer: Timer?

    //MARK: - life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        tfEmail.delegate = self
        tfPassword.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBarBack()
        // self.textField.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tfEmail.resignFirstResponder()

        return true
    }

    //MARK: - action
    @IBAction func actionEmail(_ sender: Any) {
        login()
    }

    //MARK: - methods

    func login() {

        self.email = tfEmail.text!
        self.password = tfPassword.text!

        if email.isEmpty  {
            tfEmail.error()
            msgError.isHidden = false
            msgError.text = "Este campo e obrigatorios"
        }else {
             tfEmail.errorClean()
            msgError.isHidden = true
        }

        if password.isEmpty  {
            tfPassword.error()
            msgError.isHidden = false
            msgError.text = "Este campo e obrigatorios"
        } else {
            tfPassword.errorClean()
            msgError.isHidden = true
        }
        
        Auth.auth().signIn(withEmail:self.email, password: password) { (reponse, error) in
            if error != nil  {
                self.msgError.isHidden = false
                self.msgError.text = "E-mail ou Senha esta invalido "
            } else {
                let coordinator =  HomeCoordinator(navigationController: self.navigationController!)
                coordinator.start()
            }
        }
    }

    func setupNavBarBack() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if tfEmail.text?.count != 0 {
            tfEmail.errorClean()
            msgError.isHidden = true
        }
        if tfPassword.text?.count != 0 {
            tfPassword.errorClean()
            msgError.isHidden = true
        }
        return true
    }





    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}


