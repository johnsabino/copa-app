//
//  Time.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 15/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import Foundation
class Time {
    let nome : String
    let imagem : String
    let sigla : String
    var vitorias : Int
    var derrotas : Int
    var empates : Int
    
    var pontos : Int {
        return vitorias * 3 + empates
    }
    
    init(comNome nome : String, imageName : String, sigla : String ) {
        self.nome = nome
        self.imagem = imageName
        self.sigla = sigla
        vitorias = 0
        derrotas = 0
        empates = 0
    }
    
}
