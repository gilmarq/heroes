//
//  Service.swift
//  Heroi
//
//  Created by Gilmar Queiroz on 07/05/21.
//  Copyright © 2021 Gilmar Queiroz. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI {

    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    static private let teste =    "https://gateway.marvel.com/v1/public/characters/{characterId}/comics"
    static private let privateKey = "e21ba68584952974edbd66ba8bd38cb02db220ad"
    static private let publicKey  = "5d22a109c72c4e6b850e89e8bb064c77"
    static private let limit = 50
    static let ts = String(Date().timeIntervalSince1970.description)

    private class func getCredentials() -> String {
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        print(hash)
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }

    class func loadHeros(name:String?, page:Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startsWith: String
        if let name = name,!name.isEmpty {
            startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        } else {
            startsWith = ""
        }
        let url =  basePath + "offset=\(offset)&limit=\(limit)&" + startsWith + getCredentials()
        AF.request(url).responseJSON { (response) in
            guard let data = response.data else {
                onComplete(nil)
                return
            }
            do {
         let marvelInfo = try! JSONDecoder().decode(MarvelInfo.self,from: data)
                onComplete(marvelInfo)
                print(marvelInfo)
            } catch {
                print(error.localizedDescription)
                onComplete(nil)
            }
        }
    }

    class func loadComic(name:String?, onComplete: @escaping (MarvelInfo?) -> Void) {

           let startsWith: String
           if let name = name,!name.isEmpty {
               startsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
           } else {
               startsWith = ""
           }
           let url =  "https://gateway.marvel.com/v1/public/characters/(\name)/comics" + "offset=1&limit=10&" + startsWith + getCredentials()
   print(url)
         AF.request(url).responseJSON { (response) in
                    guard let data = response.data else {
                        onComplete(nil)
                        return
                    }
                    do {
                 let marvelInfo = try JSONDecoder().decode(MarvelInfo.self,from: data)
                        onComplete(marvelInfo)
                        print(marvelInfo)
                    } catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }

    }



}

