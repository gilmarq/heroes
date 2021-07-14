//
//  QuizViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 21/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Kingfisher

class QuizViewController: UIViewController {

    //MARK: - varieble

    let quizViewModel =  QuizViewModel()
    var value = ""
    var heros:Hero!

    //MARK: - outlet

    @IBOutlet weak var questionView: UIView!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var sibTitle: UILabel!
    @IBOutlet weak var imageHero: UIImageView!

    
    init() {
        super.init(nibName: "QuizView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
        setupTimeView()
        getQuiz()
        setupNavBarBack()
        setupTitle()
    }
    
    func setupNavBarBack(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    func setup() {
        questionView.layer.masksToBounds = true
        questionView.layer.cornerRadius = 5

        if let url = URL(string: self.heros.thumbnail.url) {
            imageHero.kf.indicatorType = .activity
            imageHero.kf.setImage(with: url)
        }else {
            imageHero.image = nil
        }
    }
    
    func setupTimeView() {
        timeView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 10.0, delay: 0 , options: .curveLinear, animations: {
            self.timeView.frame.size.width = 0
        }) { (success) in
            self.showHeroes()
        }
    }
    
    func showHeroes() {

        let coordinator =  ShowHeroCoordinator(navigationController: navigationController! , heros: self.heros)
        coordinator.value = quizViewModel.totalCorrecteAnswer
        coordinator.start()
//        let  controller = ShowHeroViewController()
//      controller.totalCorrectAnswer = quizViewModel.totalCorrecteAnswer
//        self.navigationController?.pushViewController(controller, animated: true) 
    }
    
    func getQuiz() {
        quizViewModel.refreshQuiz()
        question.text = quizViewModel.questions
        for i in 0..<quizViewModel.options.count {
            let option  = quizViewModel.options[i]
            let button = answers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func setupTitle() {
        sibTitle.text = "Teste seus conhecimentos sobre a Marvel"
    }

    @IBAction func selectAnswer(_ sender: UIButton) {
        guard let  index = answers.firstIndex(of: sender) else {return}
        quizViewModel.validateAnswer(index: index)
        getQuiz()
    }
}

