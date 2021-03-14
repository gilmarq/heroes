//
//  HomeCell.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell, NibLoadableView ,ReusableView {
    
    @IBOutlet private weak var valueLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }
    func setup(with home: HomeModel) {
        self.valueLabel.text = home.text
    }
    
    func setupCard(){
        cardView.layer.masksToBounds = true
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 2
        cardView.layer.cornerRadius = 10
        
    }
    
    
}
