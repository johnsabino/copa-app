//
//  MasterViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 14/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, JogoCellDelegate {
    
    var delegate : ContainerViewControllerDelegate? {
        didSet{
            showDetailViewForIpad()
        }
    }
    var jogoSelected : Jogo!
    var selectedIndexPath : IndexPath?
    var jogos = [Jogo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(orientationDidChange), name: .UIDeviceOrientationDidChange , object: nil)
        
        
        for _ in 0...14 {
            jogos.append(deveRetornarJogo())
        }
        let nib = UINib(nibName: "JogoTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        navigationController?.navigationBar.barTintColor = .blue
    
    }
    
    func deveRetornarJogo() -> Jogo {
        if jogoSelected != nil {
            return jogoSelected
        }
        
        let listNames = ["ad","ae","af","ar","br","pt","de","es","us","fr","jp"]
        
        let index1 = arc4random_uniform(UInt32(listNames.count))
        var index2 = arc4random_uniform(UInt32(listNames.count))
        while index2 == index1 {
            index2 = arc4random_uniform(UInt32(listNames.count))
        }
        let s1 = listNames[Int(index1)]
        let s2 = listNames[Int(index2)]
        
        let timeCasa = Time(comNome: s1.uppercased() , imageName: s1 , sigla: s1.uppercased())
        let timeVisitante = Time(comNome: s2.uppercased() , imageName: s2, sigla: s2.uppercased())
        let jogo = Jogo(timeCasa: timeCasa, timeVisitante: timeVisitante, golsCasa: Int(index1), golsVisitante: Int(index2))
        return jogo
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jogos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? JogoTableViewCell else {
            return UITableViewCell()
        }
        cell.jogo = jogos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        if  Device.isPhone && Device.isPortrait {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        jogoSelected = jogos[indexPath.row]
        
        delegate?.navegarParaDetailView(jogo: jogoSelected)
    }
    
    func showDetailViewForIpad(){
        if (Device.isPad || Device.isLandscape) && !jogos.isEmpty {
            selectedIndexPath = IndexPath(row: 0, section: 0)
            jogoSelected = jogos.first
            tableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .top)
            delegate?.navegarParaDetailView(jogo: jogoSelected)
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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print(Device.isPortrait)
        print(Device.isPhone)
    }
    


}

