//
//  PreferredViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 13/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class PreferredViewController: UIViewController {
    var preferredViewModel =  PreferredViewModel()
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var oneTile: UILabel!
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(PreferredTableViewCell.self)
        preferredViewModel.formtJson()

    }
}

//MARK: - UICollectionViewDelegate
extension PreferredViewController : UITableViewDelegate {
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      // return 10
        return preferredViewModel.preferre.count
    }
}
    
//MARK:- UICollectionViewDataSource

extension PreferredViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return preferredViewModel.preferre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PreferredTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        print(preferredViewModel.preferre[indexPath.row])
        cell.setup(with: preferredViewModel.preferre[indexPath.row])
        return cell
    }
}

