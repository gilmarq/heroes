//
//  Decodable+Extension.swift
//  ProjetoCadastro
//
//  Created by Gilmar Queiroz on 24/02/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation
extension Decodable {
    
    static func formatJson<T: Decodable>(_ fileName:String, fileExtension: String = "json") -> T?{
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch{
            return nil
        }
        
    }
}
