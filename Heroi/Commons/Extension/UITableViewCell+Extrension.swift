//
//  UITableViewCell+Extrension.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 24/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let bundle =  Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier:  T.defaultReuseIdentifier)
    }
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Erro na cell : \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
    
    
}
