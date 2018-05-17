//
//  JogoTableViewCell.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 15/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class JogoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgTimeCasa: UIImageView!
    @IBOutlet weak var imgTimeVisitante: UIImageView!
    
    @IBOutlet weak var siglaTimeCasa: UILabel!
    @IBOutlet weak var siglaTimeVisitante: UILabel!
   
    @IBOutlet weak var golsTimeVisitante: UILabel!
    @IBOutlet weak var golsTimeCasa: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    var delegate : JogoCellDelegate? {
        didSet{
            atualizaView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        configuraImageViews(imgTimeCasa, imgTimeVisitante )
        imgTimeCasa.image = #imageLiteral(resourceName: "brasil")
        imgTimeVisitante.image = #imageLiteral(resourceName: "alemanha")
    }
    
    func configuraImageViews(_ imageViews : UIImageView ...){
        imageViews.forEach { iv in
            iv.clipsToBounds = true
            iv.contentMode = .scaleAspectFill
            iv.layer.cornerRadius = iv.layer.bounds.size.width/2
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func atualizaView() {
        if let jogo = delegate?.deveRetornarJogo() {
            golsTimeCasa.text = String(jogo.golsCasa)
            golsTimeVisitante.text = String(jogo.golsVisitante)
            
        }
    }
}
