//
//  CustomButton.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 18/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    var borderWidth: CGFloat = 1
    var borderColor = UIColor.black.cgColor
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        applyGradient(colors: [UIColor.orange.cgColor, UIColor.red.cgColor])
    }
    
    func setup() {
          self.clipsToBounds = true
          self.layer.cornerRadius = 10
       
    
      }
    
  func applyGradient(colors: [CGColor])
  {
      let gradientLayer = CAGradientLayer()
      gradientLayer.colors = colors
      gradientLayer.startPoint = CGPoint(x: 0, y: 0)
      gradientLayer.endPoint = CGPoint(x: 1, y: 0)
      gradientLayer.frame = self.bounds
      self.layer.insertSublayer(gradientLayer, at: 0)
  }

}
