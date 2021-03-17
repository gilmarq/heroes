//
//  PreferredTableViewCell.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 14/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class PreferredTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageHereo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setup(with preferred: PreferredModal) {
        self.imageHereo.image = UIImage(named: preferred.logo)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(){
           cardView.layer.masksToBounds = true
           cardView.layer.cornerRadius =  10
           cardView.layer.borderWidth =  1
           cardView.layer.borderColor = UIColor.lightGray.cgColor
           imageHereo.layer.masksToBounds = true
           imageHereo.layer.cornerRadius = 10
       }
    
}
