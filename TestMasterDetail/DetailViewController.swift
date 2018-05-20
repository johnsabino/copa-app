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
        let bar = navigationController?.navigationBar
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register( nib, forCellReuseIdentifier: "detailCell")
        jogo = delegate?.shouldReturnJogo()
        let headerView = TableHeaderDetailView.instantiateFromXib()
        headerView?.delegate = self
        if let headerView = headerView {
            self.title = "Semi-Final"
            
            let gradiente = CAGradientLayer()
            let width = view.frame.size.width
            let height = header.frame.size.height
            gradiente.frame = CGRect(x: 0, y: 0, width: width, height: height)

            let c1 = colorRGB(0, 206, 0, alpha: 0.8).cgColor
            let c2 = colorRGB(0, 148, 0, alpha: 0.8).cgColor
            
            gradiente.colors = [c1,c2]
            gradiente.startPoint = CGPoint(x: 1, y: 0.5)
            gradiente.endPoint = CGPoint(x: 0, y: 0.5)
            headerView.backgroundColor = .clear
            
            
            
            let g1 = CAGradientLayer()
            
            g1.frame = bar?.bounds ?? CGRect(x: 0, y: 0, width: 0, height: 0)
            g1.colors = [c1,c2]
            g1.startPoint = CGPoint(x: 1, y: 0.5)
            g1.endPoint = CGPoint(x: 0, y: 0.5)
            headerView.backgroundColor = .clear
            bar?.setBackgroundImage(g1.image, for: UIBarMetrics.default)
        
            bar?.barTintColor = .white
            bar?.shadowImage = UIImage()
            bar?.layer.shadowOpacity = 0
            bar?.isTranslucent = false
            header.backgroundColor = UIColor(patternImage: gradiente.image)
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


extension CAGradientLayer {
    
    var image : UIImage {
        UIGraphicsBeginImageContext(self.frame.size)
        self.render(in: UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
