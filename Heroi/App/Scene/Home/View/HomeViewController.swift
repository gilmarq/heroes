//
//  HomeViewController.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 19/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var universe: [HomeModel] = []
    var homeViewModel = HomeViewModel()
    var imagemStrig = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HomeCell.self)
        homeViewModel.formtJson()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    init() {
        super.init(nibName: "HomeView", bundle : nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        let coordinator = SelectCoordinator(navigationController: navigationController!)
        let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: homeViewModel.universe[indexPath.row])
        coordinator.value = cell.veue
        coordinator.start()
        
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

