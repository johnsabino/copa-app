//
//  JogoDAO.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/20/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import Foundation

enum TipoJogo : String , Decodable {
    case live = "live"
    case past = "past"
    case future = "future"
}

class JogoDAO {
    private static var jogos = [Jogo]()
    
    class func getJogosAsync( completion : @escaping ([Jogo]?, Error?)->Void ){
        if !jogos.isEmpty {
            completion(jogos,nil)
        }else{
            Router.jogos.requestWithMethod(.get) { (jogos : [Jogo]?, error) in
                if let list = jogos {
                    JogoDAO.jogos = list
                }
                completion(jogos, error)
            }
        }
    }
}
