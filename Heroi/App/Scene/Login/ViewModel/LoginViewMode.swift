//
//  LoginViewMode.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 18/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class LoginViewMode {
    
    func loginValid( login: String) -> Bool {
        if login.count >= 5{
            return true
        }else {
            return false
        }
    }
    
    func passWordValid(passWord: String) -> Bool {
        if passWord.count >= 6{
            return true
        }else {
            return false
        }
    }
}
