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
    var select: SelectModel?
    var value = ""
    var text = ""
    
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
        
        if self.textLabel.text == "QUIZ" {
            cardView.layer.masksToBounds = true
            cardView.layer.borderColor = UIColor.lightGray.cgColor
            cardView.layer.borderWidth = 2
            cardView.layer.cornerRadius = 10
            cardView.layer.backgroundColor = UIColor.gray.cgColor
            title.tintColor = .white
            textLabel.tintColor = .white
        }
        
    }
    
}
