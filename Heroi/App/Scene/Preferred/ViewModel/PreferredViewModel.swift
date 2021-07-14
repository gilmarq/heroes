//
//  PreferredViewModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 15/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class PreferredViewModel {
    
    var text = ""
    var preferre: [PreferredModal] = []
    var preferreView = PreferredViewController()
    var heros: [Hero] = []
    var loadingHeroes = false
    var name = ""
    var currentPage =  0
    var total = 0

    
    func formtJson(){
        preferre = [PreferredModal].formatJson("PreferredMock") ?? []
    }

    func loadHeroes() {
           MarvelAPI.loadHeros(name: name, page: currentPage) { (info) in
               if let info = info {
                   self.heros += info.data.results
                   self.total = info.data.total
//                   DispatchQueue.main.sync {
//                       self.loadingHeroes = false
//                       //self.label.text = "Não foram encontrados heróis com o nome \(self.name)."
//                    // preferreView.collectionView.reloadData()
//
//                   }
               }
           }
       }
}
