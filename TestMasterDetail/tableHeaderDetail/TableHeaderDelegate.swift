//
//  File.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 18/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

protocol TableHeaderDelegate {

    func jogoForHeader() -> Jogo?
    func didFilterSelected(segControl : UISegmentedControl)
    
}
