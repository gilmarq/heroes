//
//  SelectViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    var viewModel = SelectViewModel()
    var value = ""
    
    @IBOutlet weak var collectionView: UICollectionView!    
    @IBOutlet weak var heroesImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SelectCell.self)
        viewModel.formtJson()
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.heroesImage.image = UIImage(named: value)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: -INIT
    init( ) {
 
        super.init(nibName: "SelectView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDelegate
extension SelectViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.select.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PreferredViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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
