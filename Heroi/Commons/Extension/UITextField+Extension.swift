//
//  UITextField+Extension.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 19/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

extension UITextField {
    
    func setLef(image:UIImage){
        let icon = UIImageView(frame: CGRect(x: 10, y:10,width: 25, height: 25))
        icon.image = image
        let iconContainer = UIView(frame: CGRect(x:0 , y:0, width: 35, height: 45))
        iconContainer.addSubview(icon)
        leftView = iconContainer
        leftViewMode = .always
        self.tintColor = .lightGray
        
    }
    
    func setLefPass(image:UIImage){
         let icon = UIImageView(frame: CGRect(x: 10, y:10,width: 25, height: 25))
         icon.image = image
         let iconContainer = UIView(frame: CGRect(x:0 , y:0, width: 35, height: 45))
         iconContainer.addSubview(icon)
         leftView = iconContainer
         leftViewMode = .always
         self.tintColor = .lightGray
         
     }
    
}
