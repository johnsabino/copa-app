//
//  ContainerViewController.swift
//  TestMasterDetail
//
//  Created by Ada 2018 on 17/05/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, ContainerViewControllerDelegate, UIViewControllerTransitioningDelegate,DetailDelegate {
    
    var jogo : Jogo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let master = self.childViewControllers.first as? MasterViewController {
            master.delegate = self
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = AppColors.blue
        navBar?.tintColor = AppColors.white
        let atributes = [NSAttributedStringKey.foregroundColor: AppColors.white]
        navBar?.titleTextAttributes = atributes
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func navegarParaDetailView(jogo: Jogo) {
        self.jogo = jogo
        let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailViewController = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.delegate = self
        
        let isSmallScreen = Device.isSmall(screen: view)
        
        if isSmallScreen {
            navigationController?.pushViewController(detailViewController, animated: true)
        }else{
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func shouldReturnJogo() -> Jogo? {
        return self.jogo
    }

}
