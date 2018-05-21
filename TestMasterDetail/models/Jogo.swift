//
//  Jogo.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 15/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import Foundation


struct Jogo : Decodable {
    let timeCasa : Time
    let timeVisitante : Time
    var golsCasa : Int
    var golsVisitante : Int
    var tipo : TipoJogo
}
