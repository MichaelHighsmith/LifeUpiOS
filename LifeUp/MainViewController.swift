//
//  MainViewController.swift
//  LifeUp
//
//  Created by Michael Highsmith on 9/30/18.
//  Copyright © 2018 Satyr Labs. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagesViewController = PagesViewController()
        addChild(pagesViewController)
        self.view.addSubview(pagesViewController.view)
        pagesViewController.didMove(toParent: self)
        
        pagesViewController.view.frame = CGRect(x: 0, y:view.bounds.height, width: view.bounds.width, height: -view.bounds.height * (2 / 3))

    
    }


}
