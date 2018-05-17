//
//  DetailTableViewCell.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 16/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTempoDeJogo: UILabel!
    @IBOutlet weak var lblTempo: UILabel!
    @IBOutlet weak var imgViewIcon: UIImageView!
    @IBOutlet weak var imgViewFlag : UIImageView!
    @IBOutlet weak var lblTitulo : UILabel!
    @IBOutlet weak var lblDescricao : UILabel!
    
    
    var delegate : DetailDelegate? {
        didSet{
           loadCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func loadCell() {
        
    }
    
}
