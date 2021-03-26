//
//  CustomiViews.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 25/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class CustomiViews: UIView {
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
    }
}
