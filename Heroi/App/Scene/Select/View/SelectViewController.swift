//
//  SelectViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

//MARK: - enum
enum comics: String {
    case Marvel = "Marvel"
    case DC = "DC"
    case StarWars = "StarWars"
    case disney = "disney"
}

enum items: String {
    case comic = "Quadrinhos"
    case filmes =  "Filmes"
    case series = "Series"
    case quiz = "QUIZ"
    
}

class SelectViewController: UIViewController {
    
    var selectCoordinator = SelectCoordinator.self
    var viewModel = SelectViewModel()
    var value = ""
    
    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var heroesImage: UIImageView!
    
    //MARK: - Life cyclo
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SelectCell.self)
        viewModel.formtJson()
        heroesImage.image = UIImage(named : value )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
    }
    
    //MARK: -INIT
    init( ) {
        super.init(nibName: "SelectView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNav() {
        switch value {
            case comics.Marvel.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.red
                navigationController?.navigationBar.tintColor = UIColor.white
                setupNavBarBack()
            case comics.DC.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.blue
                navigationController?.navigationBar.tintColor = UIColor.white
                setupNavBarBack()
            case comics.StarWars.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.white
                navigationController?.navigationBar.tintColor = UIColor.black
                setupNavBarBack()
            case comics.disney.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.black
                navigationController?.navigationBar.tintColor = UIColor.yellow
                setupNavBarBack()
            default: break
        }
    }
    
    func setupNavBarBack() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}

//MARK: - UICollectionViewDelegate
extension SelectViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         
        return viewModel.select.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.select[indexPath.row]
        
            switch item.text {
                case items.filmes.rawValue:
                let coordinator = PreferredCoordinator(navigationController:navigationController!)
                coordinator.start()
                case items.comic.rawValue:
                let coordinator = PreferredCoordinator(navigationController:navigationController!)
                coordinator.start()
                case items.series.rawValue:
                let coordinator = PreferredCoordinator(navigationController:navigationController!)
                coordinator.start()
                case items.quiz.rawValue:
                let coordinator = QuizCoordinator(navigationController:navigationController!)
                coordinator.start()
                default:  break
            }
    
    }
}

//MARK:- UICollectionViewDataSource
extension SelectViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let controller = PreferredViewController()
        let cell: SelectCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: viewModel.select[indexPath.row])
        controller.value = cell.value
        
        return cell
    }
    
}
