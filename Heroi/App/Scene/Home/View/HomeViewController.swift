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
   // let homes: HomeModel
    
    
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
//
//    func showValidation(_ home: HomeModel, value: String) {
//        let controller =  SelectViewController(home: home, value: value)
//
//        controller.delegate = self
//        present(controller, animated: true, completion: nil)
    //}
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
         let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: homeViewModel.universe[indexPath.row])
        
        controller.value =  cell.veue
        print(homeViewModel.universe[indexPath.section])
        self.navigationController?.pushViewController(controller, animated: false)
    }
}

//MARK:- UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
         // cell.delegate = self
         cell.setup(with: homeViewModel.universe[indexPath.row])
        return cell
    }
}
//MARK:- UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func  collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = (self.collectionView.bounds.width / 2) - 10
        let heigth = self.collectionView.bounds.height / 4
        
        return CGSize(width: width, height: heigth)
    }
    
}

//extension HomeViewController: SelectDelegate {
//    func didContinue(view: SelectViewController) {
//        self.navigationController?.pushViewController(SelectViewController(home: view.home, value: view.value), animated: true)
//    }
//
//
//}
//
//extension HomeViewController: CellDelegate {
//    func did(cell: HomeCell) {
//        guard let home =  cell.home else { return }
//        showValidation(home , value: cell.value)
//    }
//
//}
