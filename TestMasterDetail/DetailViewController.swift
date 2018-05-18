//
//  DetailViewController.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/14/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableHeaderDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    var name : String?
    var jogo : Jogo?
    @IBOutlet weak var header: UIView!
    
    var delegate : DetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register( nib, forCellReuseIdentifier: "detailCell")
        jogo = delegate?.shouldReturnJogo()
        let headerView = TableHeaderDetailView.instantiateFromXib()
        headerView?.delegate = self
        if let headerView = headerView {
           header.addSubview(headerView)
        }
    }

    func jogoForHeader() -> Jogo? {
        return jogo
    }
    
    func didFilterSelected(segControl: UISegmentedControl) {
        print("filter selected \(segControl.selectedSegmentIndex)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }


}
