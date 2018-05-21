//
//  DetailViewController.swift
//  TestMasterDetail
//
//  Created by Ramires Moreira on 5/14/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TableHeaderDelegate, DetailDelegate{
    func shouldReturnJogo() -> Jogo? {
        return jogo
    }
    
    
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
            self.title = "Semi-Final"
            let bar = navigationController?.navigationBar
            headerView.backgroundColor = .clear
            bar?.barTintColor = AppColors.green
            bar?.shadowImage = UIImage()
            bar?.layer.shadowOpacity = 0
            bar?.isTranslucent = false
            bar?.tintColor = .white
            header.addSubview(headerView)
        }
        
    }
    
    func colorRGB(_ red : CGFloat , _ green : CGFloat, _ blue : CGFloat, alpha : CGFloat)-> UIColor{
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }

    func jogoForHeader() -> Jogo? {
        return jogo
    }
    
    func didFilterSelected(segControl: UISegmentedControl) {
        print("filter selected \(segControl.selectedSegmentIndex)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jogo?.lances?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        cell.lance = jogo?.lances![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }


}


extension CAGradientLayer {    
    var image : UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        self.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
