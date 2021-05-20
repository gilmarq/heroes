//
//  HomeViewController.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 19/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

enum heroes: String {
    case marvel = "Marvel"
    case dc = "DC"
    case starWars = "StarWars"
}

//enum comics: String {
//    case Marvel = "Marvel"
//    case DC = "DC"
//    case StarWars = "StarWars"
//    case disney = "disney"
//}
class HomeViewController: UIViewController {
    
    //MARK:- Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- o
    
    var universe: [HomeModel] = []
    var homeViewModel = HomeViewModel()
    var imagemStrig = ""
    var value = ""
    //MARK:- parameter
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HomeCell.self)
        homeViewModel.formtJson()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:- init
    init() {
        super.init(nibName: "HomeView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- methods
    func setupNav(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}

//MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return homeViewModel.universe.count
    }
    
    func numberOfSelections(in collectionView: UICollectionView)-> Int{
        return homeViewModel.universe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let value = homeViewModel.universe[indexPath.row]
        print(value.image)
        switch value.image {
            case heroes.marvel.rawValue:

                let coordinator = SelectCoordinator(navigationController: navigationController!)
                let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
                cell.setup(with: homeViewModel.universe[indexPath.row])
                coordinator.value = cell.veue
                coordinator.start()

            case heroes.dc.rawValue:
                let coordinator = SelectCoordinator(navigationController: navigationController!)
                               let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
                               cell.setup(with: homeViewModel.universe[indexPath.row])
                               coordinator.value = cell.veue
                               coordinator.start()
            case heroes.starWars.rawValue:

                 let coordinator = SelectCoordinator(navigationController: navigationController!)
                               let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
                               cell.setup(with: homeViewModel.universe[indexPath.row])
                               coordinator.value = cell.veue
                               coordinator.start()            default:
                break

        }
        //        let coordinator = SelectCoordinator(navigationController: navigationController!)
        //        let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        //        cell.setup(with: homeViewModel.universe[indexPath.row])
        //        coordinator.value = cell.veue
        //        coordinator.start()
        
    }
    
}

//MARK:- UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: homeViewModel.universe[indexPath.row])
        return cell
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func  collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (self.collectionView.bounds.width)
        let heigth = self.collectionView.bounds.height / 4
        
        return CGSize(width: width, height: heigth)
    }
    
}

