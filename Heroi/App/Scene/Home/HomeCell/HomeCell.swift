//
//  HomeCell.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit


protocol CellDelegate: class {
    func did(cell: HomeCell)
}

class HomeCell: UICollectionViewCell, NibLoadableView ,ReusableView {
    @IBOutlet weak var setupLabel: UILabel!

    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var cardView: UIView!
    var home: HomeModel?
    var veue = ""
  
    var delegate: CellDelegate?
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }
    
    func setup(with home: HomeModel) {
        self.home = home
        self.veue = home.image
        self.imageCard.image = UIImage(named: home.image)

    }

    func setHidenn() {
        self.setupLabel.isHidden = true
        setupLabel.textColor = .black
    }

    func setuph() {
        imageCard.layer.opacity = 40
    }
    
    func setupCard(){
        cardView.layer.masksToBounds = true
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 1
        cardView.layer.cornerRadius = 10
    }
    
}
