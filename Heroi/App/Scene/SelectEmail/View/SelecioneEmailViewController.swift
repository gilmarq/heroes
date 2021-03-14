//
//  SelecioneEmailViewController.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 19/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelecioneEmailViewController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!

    var select = SelectEmailViewModel() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(SelectTableViewCell.self)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.register(SelectTableViewCell.self)
        select.loadJson()
        
    }
    
    init() {
        super.init(nibName: "SelecioneEmailView", bundle : nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDelegate
extension SelecioneEmailViewController : UITableViewDelegate {
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return select.email.count
    }
}
//MARK:- UICollectionViewDataSource

extension SelecioneEmailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return select.email.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SelectTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
         cell.setup(with: select.email[indexPath.row])
        return cell
    }
    
}
