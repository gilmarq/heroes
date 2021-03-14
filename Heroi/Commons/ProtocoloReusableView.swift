//
//  ProtocoloReusableView.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 22/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
