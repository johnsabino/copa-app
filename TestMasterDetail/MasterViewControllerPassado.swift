//
//  MasterViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 14/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class MasterViewControllerPassado: UITableViewController, DetailDelegate {

    let names = ["Ramires","João"]
    var nameSelected : String!
    var selectedIndexPath : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(orientationDidChange), name: .UIDeviceOrientationDidChange , object: nil)
        showDetailViewForIpad()
    }
    
    func showDetailViewForIpad(){
        let isIpad = UIDevice.current.userInterfaceIdiom == .pad
        var isLandscape = UIApplication.shared.statusBarOrientation == .landscapeLeft
        isLandscape = isLandscape || UIApplication.shared.statusBarOrientation == .landscapeRight
        
        if isIpad || isLandscape {
            if !names.isEmpty {
                selectedIndexPath = IndexPath(row: 0, section: 0)
                nameSelected = names.first
                tableView.selectRow(at: selectedIndexPath, animated: false, scrollPosition: .top)
                
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        nameSelected = names[indexPath.row]
        
        if UIDevice.current.userInterfaceIdiom == .phone &&
           UIApplication.shared.statusBarOrientation == .portrait {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let detailView = Bundle.main.loadNibNamed("DetailViewController", owner: self, options: nil)![0] as! DetailViewController
        detailView.delegate = self
        
    }
    
    @objc func orientationDidChange(){
        if UIApplication.shared.statusBarOrientation == .portrait {
            if let index = selectedIndexPath{
                tableView.deselectRow(at: index , animated: false)
                
            }
        }else {
            tableView.selectRow(at: selectedIndexPath, animated: true, scrollPosition: .bottom)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let view = DetailViewController.fromNib()
            view.delegate = self
        }
    }

    func shouldReturName() -> String {
        return nameSelected
    }

}

