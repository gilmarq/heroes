//
//  CustomButtonRadius.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 24/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class CustomButtonRadius: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: 0, dy: 0), byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: frame.size.height/2, height: 2 ))
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 2.0, y: 0.5)
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        layer.insertSublayer(gradient, at: 0)
    }
}
