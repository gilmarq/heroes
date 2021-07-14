//
//  PreferredTableViewCell.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 14/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Kingfisher

class PreferredTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageHereo: UIImageView!
    var name = ""
    @IBOutlet weak var nameHeroisLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setup(with hero: Hero) {
          print(name)
        nameHeroisLabel.text = hero.name
        if let url = URL(string: hero.thumbnail.url) {
            imageHereo.kf.indicatorType = .activity
            imageHereo.kf.setImage(with: url)
        } else {
            imageView?.image = nil
        }
        imageHereo.layer.masksToBounds = true
        imageHereo.layer.cornerRadius = 50
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView() {
           cardView.layer.masksToBounds = true
           cardView.layer.cornerRadius =  10
           cardView.layer.borderWidth =  1
           cardView.layer.borderColor = UIColor.lightGray.cgColor
       }
}
