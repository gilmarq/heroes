//
//  SelectEmailViewModel.swift
//  ProjetoHerois
//
//  Created by Gilmar Queiroz on 06/03/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SelectEmailViewModel {

    var email: [EmailModel] = []
    var logo = ""
    var text = ""
    
    func loadJson(){
           email = [EmailModel].formatJson("EmailMock") ?? []
       }
}
