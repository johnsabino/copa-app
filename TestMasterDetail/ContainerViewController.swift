//
//  ContainerViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 17/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, ContainerViewControllerDelegate, UIViewControllerTransitioningDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let master = self.childViewControllers.first as? MasterViewController {
            master.delegate = self
        }
    }
    
    func navegarParaDetailView(jogo: Jogo) {
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = sb.instantiateViewController(withIdentifier: "DetailViewController")
        
        if Device.isPortrait && !Device.isPad {
            navigationController?.pushViewController(detailViewController, animated: true)
        }else{
          splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    

}
