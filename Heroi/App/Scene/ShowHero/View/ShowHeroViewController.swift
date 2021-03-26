//
//  ShowHeroViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 17/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

enum hero: String {
    case IronMan = "ironMan"
    case Capitao = "capitao"
    case thor = "thor"
    case hulk = "hulk"
}

class ShowHeroViewController: UIViewController {
    
    @IBOutlet weak var imagemHero: UIImageView!
    @IBOutlet weak var cardQuiz: UIView!
    @IBOutlet weak var cardMovie: UIView!
    @IBOutlet weak var cardComic: UIView!
    @IBOutlet weak var titleHero: UILabel!
    @IBOutlet weak var quizAnswer: UILabel!
    var totalCorrectAnswer: Int = 0
    var value = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        setupTitle()
        setupView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func action(_ sender: Any) {
        let coordinator =  HomeCoordinator(navigationController: navigationController!)
        coordinator.start()
    }
    
    func setupView() {
        quizAnswer.text = String(totalCorrectAnswer)
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
    
    func setupTitle() {
        switch value {
            case hero.IronMan.rawValue:
                titleHero.text = "Iron Man"
                imagemHero.image = UIImage(named: value)
            case hero.Capitao.rawValue:
                titleHero.text = "Capitão America"
                imagemHero.image = UIImage(named: value)
            case hero.thor.rawValue:
                titleHero.text = "Thor"
                imagemHero.image = UIImage(named: value)
            case hero.hulk.rawValue:
                titleHero.text = "Hulk"
                imagemHero.image = UIImage(named: value)
            default:
                titleHero.text = "Universo de Heróis"
                imagemHero.image = UIImage(named: "Logo")
                
        }
    }
}
