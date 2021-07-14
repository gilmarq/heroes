//
//  ShowHeroViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 17/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Kingfisher

class ShowHeroViewController: UIViewController {
    
    @IBOutlet weak var imagemHero: UIImageView!
    @IBOutlet weak var cardQuiz: UIView!
    @IBOutlet weak var titleHero: UILabel!
    @IBOutlet weak var quizAnswer: UILabel!

    var totalCorrectAnswer: Int = 0
    var value = ""
    var heros:Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        setupView()
        print(heros)
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

        if let url = URL(string: self.heros.thumbnail.url) {
                 imagemHero.kf.indicatorType = .activity
                 imagemHero.kf.setImage(with: url)
             }else {
                 imagemHero.image = nil
             }
             titleHero.text = heros.name
    }
    
}
