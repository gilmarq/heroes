//
//  SelectViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var heroesImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SelectCell.self)
         navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: -INIT
    init() {
        super.init(nibName: "SelectView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDelegate
extension SelectViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let controller = SelectViewController()
       self.navigationController?.pushViewController(controller, animated: true)
     }
}

//MARK:- UICollectionViewDataSource
extension SelectViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell: SelectCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
       // cell.setup(with: homeViewModel.universe[indexPath.row])
        return cell
    }
}
////MARK:- UICollectionViewDelegateFlowLayout
//extension SelectViewController: UICollectionViewDelegateFlowLayout {
//    
//    func  collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
//                          sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let width: CGFloat = (self.collectionView.bounds.width / 2) - 8
//        let heigth = self.collectionView.bounds.height / 5
//        
//        return CGSize(width: width, height: heigth)
//    }
//    
//}

