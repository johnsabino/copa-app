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
    var jogos = [Jogo]() {
        didSet{
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(orientationDidChange), name: .UIDeviceOrientationDidChange , object: nil)
    
        let nib = UINib(nibName: "JogoTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadJogos), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        refreshControl?.attributedTitle = NSAttributedString(string: "buscando jogos...")
        refreshControl?.beginRefreshing()
        viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bar = navigationController?.navigationBar
        let tab = tabBarController?.tabBar
        bar?.barTintColor = AppColors.green
        tab?.tintColor = AppColors.green
    }
    
    override func viewDidAppear(_ animated: Bool) {
       loadJogos()
    }
    
    @objc func loadJogos() {
        let types : [TipoJogo] = [.live,.future,.past]
        let index = tabBarController?.selectedIndex ?? 0
        JogoDAO.getJogosAsync { (jogos, error) in
            if let jogos = jogos {
                self.jogos = jogos.filter {$0.tipo == types[index]}
                if !Device.isSmall(screen: self.view) && !self.jogos.isEmpty{
                    self.jogoSelected = self.jogos.first
                    self.delegate?.navegarParaDetailView(jogo: self.jogoSelected)
                    let index = IndexPath(row: 0, section: 0)
                    self.tableView.selectRow(at: index, animated: true, scrollPosition: .top)
                }
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    func deveRetornarJogo() -> Jogo {
        return jogoSelected
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
        if Device.isLandscape && !Device.isSmall(screen: view){
            delegate?.popViewController()
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }

}

