//
//  SelectViewModel.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 15/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation

class SelectViewModel {
    
    var select: [SelectModel]?
    var text = ""
    
    func formtJsonMavel(){
        select = [SelectModel].formatJson("SelectMock")
    }
    func formtJsonDC(){
        select = [SelectModel].formatJson("SelectMock")
    }
    func formtJsonStarWars(){
        select = [SelectModel].formatJson("SelectMock")
    }
    func formtJsonDisaney(){
        select = [SelectModel].formatJson("SelectMock")
    }
}
