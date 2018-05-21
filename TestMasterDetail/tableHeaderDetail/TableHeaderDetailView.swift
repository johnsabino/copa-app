//
//  TableHeaderDetailViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 18/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class TableHeaderDetailView: UIView {

    @IBOutlet weak var lblTempo: UILabel!
    
    @IBOutlet weak var imgTimeCasa: UIImageView!
    @IBOutlet weak var imgTimeVisitante: UIImageView!
    
    @IBOutlet weak var lblGolsCasa: UILabel!
    @IBOutlet weak var lblGolsVisitante: UILabel!
    
  
    @IBOutlet weak var lblSiglaCasa: UILabel!
    @IBOutlet weak var lblSiglaVisitante: UILabel!
    
    @IBOutlet weak var filtroLances: UISegmentedControl!
    

    var delegate : TableHeaderDelegate? {
        didSet {
            atualizaView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(orientationDidChange), name: .UIDeviceOrientationDidChange , object: nil)
    }
    
    @objc func orientationDidChange(){
        
    }

    func atualizaView() {
        let jogo = delegate?.jogoForHeader()
        let timeCasa = jogo?.timeCasa
        let timeVisitante = jogo?.timeVisitante
        
        imgTimeCasa.image = UIImage(named: timeCasa?.imagem ?? "br")
        imgTimeVisitante.image = UIImage(named: timeVisitante?.imagem ?? "br")
        
        lblGolsCasa.text = "\(jogo?.golsCasa ?? 0)"
        lblGolsVisitante.text = "\(jogo?.golsVisitante ?? 0)"
        
        lblSiglaCasa.text = timeCasa?.sigla
        lblSiglaVisitante.text = timeVisitante?.sigla
        lblTempo.layer.masksToBounds = true
        lblTempo.layer.cornerRadius = 10
        
        if jogo?.tipo != .live {
            lblTempo.text = "dd/mm HH:mm"
        }
    }
    
    class func instantiateFromXib() -> TableHeaderDetailView? {
        let xib = UINib(nibName: "TableHeaderDetail", bundle: Bundle.main)
        if let header =  xib.instantiate(withOwner: nil, options: nil).first as? TableHeaderDetailView {
            return header
        }
        return nil
    }
    
    @IBAction func filterSelected(_ sender: UISegmentedControl) {
        delegate?.didFilterSelected(segControl: sender)
    }
    

}
