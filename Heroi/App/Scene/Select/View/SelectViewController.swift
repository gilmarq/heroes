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
    case quiz = "QUIZ"

}

class SelectViewController: UIViewController {
    
    var selectCoordinator = SelectCoordinator.self
    var viewModel = SelectViewModel()
    var currentPage =  0
    var total = 0
    var value = ""
    var heros: [Hero] = []
    var loadingHeroes = false
    var name = ""

    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var heroesImage: UIImageView!
    
    //MARK: - Life cyclo
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SelectCell.self)
        //viewModel.formtJson()
        heroesImage.image = UIImage(named : value )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNav()
        //loadHeroes()
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
            loadHeroes()
            viewModel.formtJsonMavel()

            case comics.DC.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.blue
                navigationController?.navigationBar.tintColor = UIColor.white
                setupNavBarBack()
                viewModel.formtJsonDC()
            print(value)
            case comics.StarWars.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.white
                navigationController?.navigationBar.tintColor = UIColor.black
                setupNavBarBack()
                viewModel.formtJsonStarWars()
             print(value)
            case comics.disney.rawValue:
                navigationController?.navigationBar.barTintColor = UIColor.black
                navigationController?.navigationBar.tintColor = UIColor.yellow
                setupNavBarBack()
                viewModel.formtJsonDisaney()
             print(value)
            default: break
        }
    }
    
    func setupNavBarBack() {
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }

    func loadHeroes() {
        MarvelAPI.loadHeros(name: name, page: currentPage) { (info) in
            if let info = info {
                self.heros += info.data.results
                self.total = info.data.total
//                DispatchQueue.main.sync {
//                    self.loadingHeroes = false
//                    self.label.text = "Não foram encontrados heróis com o nome \(self.name)."
//                    self.collectionView.reloadData()
//                }
            }
        }
    }

    func selectJson(){

    }
}

//MARK: - UICollectionViewDelegate
extension SelectViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return viewModel.select?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.select?[indexPath.row]
        
        switch item?.text {
            case items.filmes.rawValue:
                print(value)
//                let coordinator = PreferredCoordinator(navigationController:navigationController!)
//                coordinator.start()
            case items.comic.rawValue:
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
        cell.setup(with: (viewModel.select?[indexPath.row])!)
        controller.value = cell.value
        
        return cell
    }
    
}
