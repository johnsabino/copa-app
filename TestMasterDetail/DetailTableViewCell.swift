//
//  DetailTableViewCell.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 16/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
