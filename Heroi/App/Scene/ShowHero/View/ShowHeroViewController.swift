//
//  ShowHeroViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 17/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class ShowHeroViewController: UIViewController {

    @IBOutlet weak var cardQuiz: UIView!

    @IBOutlet weak var cardMovie: UIView!
    @IBOutlet weak var cardComic: UIView!
    @IBOutlet weak var titleHero: UILabel!
    @IBOutlet weak var quizAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()
    }

    @IBAction func action(_ sender: Any) {
        let controller = PreLoginViewController()
        self.navigationController?.pushViewController(controller, animated:true)
    }
    
    func setupView() {
        titleHero.tintColor = .red
        
        cardQuiz.layer.masksToBounds = true
        cardQuiz.layer.cornerRadius = 10
        cardQuiz.layer.borderWidth = 1
        cardQuiz.layer.borderColor = UIColor.lightGray.cgColor
        
        cardComic.layer.masksToBounds = true
        cardComic.layer.cornerRadius = 10
        cardComic.layer.borderWidth = 1
        cardComic.layer.borderColor = UIColor.lightGray.cgColor
        
        cardMovie.layer.masksToBounds = true
        cardMovie.layer.cornerRadius = 10
        cardMovie.layer.borderWidth = 1
        cardMovie.layer.borderColor = UIColor.lightGray.cgColor
    }
}
