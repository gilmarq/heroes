//
//  QuizViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 21/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionView: UIView!
    @IBOutlet var answers: [UIButton]!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var sibTitle: UILabel!
    
    let quizViewModel =  QuizViewModel()
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
    }
    
    func setupNavBarBack(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    func setup() {
        questionView.layer.masksToBounds = true
        questionView.layer.cornerRadius = 5
    }
    
    func setupTimeView() {
        timeView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 20.0, delay: 1 , options: .curveLinear, animations: {
           self.timeView.frame.size.width = 0
        }) { (success) in
           self.showHeroes()
        }
    }
    
    func showHeroes() {
        let  controller = ShowHeroViewController()
        controller.totalCorrectAnswer = quizViewModel.totalCorrecteAnswer
        self.navigationController?.pushViewController(controller, animated: true) 
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
        
    }
        
    @IBAction func selectAnswer(_ sender: UIButton) {
        guard let  index = answers.firstIndex(of: sender) else {return}
        quizViewModel.validateAnswer(index: index)
        getQuiz()
        
    }
    
    
    
    
}

