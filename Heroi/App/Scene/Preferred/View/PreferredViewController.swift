//
//  PreferredViewController.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 13/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class PreferredViewController: UIViewController {

    let preferredCoordinator =  PreferredCoordinator.self

    var heros: [Hero] = []
    var loadingHeroes = false
    var name: String?
    var currentPage =  0
    var total = 0
     var value = ""
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var oneTile: UILabel!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var loanding: UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(PreferredTableViewCell.self)
        loadHeroes()
        setupNavBarBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBarBack()
    }

    //MARK: - Method
    func setupNavBarBack(){
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
                       self.loanding.isHidden = true
                       self.TableView.reloadData()
                   }
               }
           }
}

//MARK: - UICollectionViewDelegate
extension PreferredViewController : UITableViewDelegate {
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heros.count
    }
}

//MARK:- UICollectionViewDataSource
extension PreferredViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let herois = heros[indexPath.row]
        let cell: PreferredTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setup(with: herois)
        let coordinator = SelectCoordinator(navigationController:navigationController!, heros: heros[tableView.indexPathForSelectedRow!.row])
        coordinator.start()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PreferredTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let herois = heros[indexPath.row]
        cell.setup(with: herois)
        return cell
    }
}

