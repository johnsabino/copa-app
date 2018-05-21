//
//  Lance.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/20/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

enum TipoLance : String, Decodable {
    case gol = "gol"
    case falta = "falta"
    case penalti = "penalti"
    case substituicao = "substituicao"
    
}

struct Lance : Decodable {
    let tipo : String
    let tempo : Int
    let time : Time
    let titulo : String
    let descricao : String
}
