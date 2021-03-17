//
//  SelectViewModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 15/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class SelectViewModel {
    
    var select: [SelectModel] = []
    var text = ""
    
    func formtJson(){
        select = [SelectModel].formatJson("SelectMock") ?? []
    }
}
