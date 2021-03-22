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
    @IBOutlet weak var answers: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var timeView: UIView!
    
    @IBOutlet weak var sibTitle: UILabel!
    init() {
        super.init(nibName: "QuizView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setup()
    }
    
    func setup() {
        questionView.layer.masksToBounds = true
        questionView.layer.cornerRadius = 5
    }
    

    @IBAction func selectAnswer(_ sender: UIButton) {
    }
}
