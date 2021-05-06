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
    
    func formtJson(){
        preferre = [PreferredModal].formatJson("PreferredMock") ?? []
    }
}
