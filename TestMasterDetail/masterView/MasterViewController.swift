//
//  MasterViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 14/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, JogoCellDelegate {
    
    var delegate : ContainerViewControllerDelegate?
    let names = ["Ramires","João","Maria","Pedro"]
    var nameSelected : String!
    var selectedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(orientationDidChange), name: .UIDeviceOrientationDidChange , object: nil)
        showDetailViewForIpad()
        
        let nib = UINib(nibName: "JogoTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")

    }

    func deveRetornarJogo() -> Jogo {
        let url = URL(fileURLWithPath: "")
        let timeCasa = Time(comNome: "Brasil", imagePath: url , sigla: "BRA")
        let timeVisitante = Time(comNome: "ALemanha", imagePath: url, sigla: "ALE")
        let jogo = Jogo(timeCasa: timeCasa, timeVisitante: timeVisitante, golsCasa: 0, golsVisitante: 0)
        return jogo
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Nomes"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? JogoTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        if  Device.isPhone && Device.isPortrait {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        nameSelected = names[indexPath.row]
        delegate?.navegarParaDetailView(jogo: deveRetornarJogo())
    }
    
    func showDetailViewForIpad(){
        if (Device.isPad || Device.isLandscape) && !names.isEmpty {
            selectedIndexPath = IndexPath(row: 0, section: 0)
            nameSelected = names.first
            tableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .top)
            delegate?.navegarParaDetailView(jogo: deveRetornarJogo())
        }
    }
    
    @objc func orientationDidChange(){
        if Device.isLandscape && Device.isPhone {
            delegate?.popViewController()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

}

