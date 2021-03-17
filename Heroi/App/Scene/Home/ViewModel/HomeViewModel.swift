//
//  HomeViewModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 12/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    var universe: [HomeModel] = []
    var text = ""
    
    func formtJson(){
        universe = [HomeModel].formatJson("HomeMock") ?? []
    }

    func teste() {
        //text = universe.image
    }
}
