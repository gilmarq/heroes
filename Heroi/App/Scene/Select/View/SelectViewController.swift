//
//  SelectViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit
import Kingfisher

class SelectViewController: UIViewController {
    
    var selectCoordinator = SelectCoordinator.self
    var viewModel = SelectViewModel()
    var API = MarvelAPI()
    var currentPage =  0
    var total = 0
    var value = ""
    var heros:Hero!
    var loadingHeroes = false
    var name = ""
    var img: UIImageView!

    //MARK: - outlet
    @IBOutlet weak var nameHero: UILabel!
    @IBOutlet weak var heroesImage: UIImageView!
    @IBOutlet weak var descritopnLabel: UILabel!


    //MARK: - Life cyclo
    override func viewDidLoad() {
        super.viewDidLoad()
        customView()
        viewModel.formtJsonMavel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBarBack()
    }
    
    //MARK: -INIT
    init() {
        super.init(nibName: "SelectView", bundle : nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

     //MARK: - action

    @IBAction func actionQuiz(_ sender: Any) {
        let coordinator =  QuizCoordinator(navigationController: navigationController! , heros: self.heros)
        coordinator.start()

    }

    //MARK: - method
    func setupNavBarBack() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }

    func customView() {
        if let url = URL(string: self.heros.thumbnail.url) {
            heroesImage.kf.indicatorType = .activity
            heroesImage.kf.setImage(with: url)
        }else {
            heroesImage.image = nil
        }
        nameHero.text = heros.name
        descritopnLabel.text = heros.description
    }
}
