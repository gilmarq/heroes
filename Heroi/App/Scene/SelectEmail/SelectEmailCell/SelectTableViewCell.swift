//
//  SelectTableViewCell.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 24/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectTableViewCell: UITableViewCell, NibLoadableView,ReusableView {

    @IBOutlet weak var content: UIView!
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var Logo: UIImageView!
    @IBOutlet private weak var labelEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupView()
    }
    
    func setup(with email: EmailModel) {
        self.Logo.image = UIImage(named: email.logo)
        self.labelEmail.text = email.text
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
      //  contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top:0,
//                                                                     left: 0,
//                                                                     bottom: 0,
//                                                                     right: 0))
    }

    func setupView(){
       // contentView.backgroundColor = UIColor.white.withAlphaComponent(0)
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius =  10 
        cardView.layer.borderWidth =  1
        cardView.layer.borderColor = UIColor.lightGray.cgColor
    }

}
