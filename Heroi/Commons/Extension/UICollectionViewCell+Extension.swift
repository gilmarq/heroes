//
//  UICollectionViewCell+Extension.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 22/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let bundle =  Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
        func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
            
            guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
                fatalError("Erro na cell : \(T.defaultReuseIdentifier)")
            }
            return cell
        }
        
    }

