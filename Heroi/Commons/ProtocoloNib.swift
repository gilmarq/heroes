//
//  ProtocoloNib.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 22/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

protocol NibLoadableView: class{
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
