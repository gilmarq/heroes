//
//  SelectCell.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 13/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectCell: UICollectionViewCell,NibLoadableView ,ReusableView  {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCardView()
    }
    func setup(with text: SelectModel) {
        self.textLabel.text = text.text
    }
    
    func setupCardView() {
        cardView.layer.masksToBounds = true
        cardView.layer.borderColor = UIColor.lightGray.cgColor
        cardView.layer.borderWidth = 2
        cardView.layer.cornerRadius = 10
        
    }
    
}
