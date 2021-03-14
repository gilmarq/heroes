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
    
    var homeViewModel = HomeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HomeCell.self)
        homeViewModel.formtJson()
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    init() {
        super.init(nibName: "HomeView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let controller = SelectViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK:- UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    // called when clicked
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Got clicked!")
    }
    
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
        
        let width: CGFloat = (self.collectionView.bounds.width / 2) - 8
        let heigth = self.collectionView.bounds.height / 5
        
        return CGSize(width: width, height: heigth)
    }
    
}
