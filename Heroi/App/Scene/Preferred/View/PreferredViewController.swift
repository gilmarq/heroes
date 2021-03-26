//
//  PreferredViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 13/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

//MARK: - enum

class PreferredViewController: UIViewController {
    var preferredViewModel =  PreferredViewModel()
    let preferredCoordinator =  PreferredCoordinator.self
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var oneTile: UILabel!
    @IBOutlet weak var TableView: UITableView!
    var value = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(PreferredTableViewCell.self)
        preferredViewModel.formtJson()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBarBack()
    }
    
    func setupNavBarBack(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
}

//MARK: - UICollectionViewDelegate
extension PreferredViewController : UITableViewDelegate {
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return preferredViewModel.preferre.count
    }
}

//MARK:- UICollectionViewDataSource
extension PreferredViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferredViewModel.preferre.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: PreferredTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: preferredViewModel.preferre[indexPath.row])
        
        let coordinator = ShowHeroCoordinator(navigationController:navigationController!)
        coordinator.imagemString = cell.value
        coordinator.value = cell.value
        coordinator.start()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PreferredTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: preferredViewModel.preferre[indexPath.row])
        return cell
    }
}

