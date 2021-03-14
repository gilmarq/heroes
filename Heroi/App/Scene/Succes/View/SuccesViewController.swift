//
//  SuccesViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 14/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SuccesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    init() {
           super.init(nibName: "SuccesViewController", bundle : nil)
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textSucess: UILabel!
    @IBOutlet weak var cardSucess: UIView!
    @IBOutlet weak var cardGreen: UIView!
    
    
    func setupView() {
        image.layer.masksToBounds = true
        cardSucess.layer.masksToBounds = true
        cardGreen.layer.masksToBounds = true
        image.layer.cornerRadius = 4
        cardSucess.layer.cornerRadius = 4
        cardGreen.layer.cornerRadius = 10
    }
}
