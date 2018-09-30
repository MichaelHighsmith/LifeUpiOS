//
//  PagesViewController.swift
//  LifeUp
//
//  Created by Michael Highsmith on 9/30/18.
//  Copyright © 2018 Satyr Labs. All rights reserved.
//

import UIKit

class PagesViewController: UIViewController {
    
    let moveRightButton = UIButton()
    let moveLeftButton = UIButton()
    var taskViewController = TaskViewController()
    var shopViewController = ShopViewController()
    var rewardViewController = RewardViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskViewController = TaskViewController()
        addChild(taskViewController)
        self.view.addSubview(taskViewController.view)
        taskViewController.didMove(toParent: self)
        
        moveLeftButton.isHidden = true
        
        setUpButtons()
    }
    
    func setUpButtons() {
        view.addSubview(moveRightButton)
        moveRightButton.backgroundColor = UIColor.green
        moveRightButton.frame = CGRect(x: view.bounds.width - 50, y: view.bounds.height / 3, width: 50, height: 50)
        
        let rightTap = UITapGestureRecognizer(target: self, action: #selector(navigateRight))
        rightTap.numberOfTapsRequired = 1
        moveRightButton.isUserInteractionEnabled = true
        moveRightButton.addGestureRecognizer(rightTap)
        
        view.addSubview(moveLeftButton)
        moveLeftButton.backgroundColor = UIColor.green
        moveLeftButton.frame = CGRect(x: 0, y: view.bounds.height / 3, width: 50, height: 50)
        
        let leftTap = UITapGestureRecognizer(target: self, action: #selector(navigateLeft))
        leftTap.numberOfTapsRequired = 1
        moveLeftButton.isUserInteractionEnabled = true
        moveLeftButton.addGestureRecognizer(leftTap)
    }
    
    @objc func navigateLeft() {
        if rewardViewController.view.isDescendant(of: self.view) {
            rewardViewController.view.removeFromSuperview()
            
            addChild(shopViewController)
            self.view.addSubview(shopViewController.view)
            shopViewController.didMove(toParent: self)
            
            moveRightButton.isHidden = false
            view.sendSubviewToBack(shopViewController.view)
        } else if shopViewController.view.isDescendant(of: self.view) {
            shopViewController.view.removeFromSuperview()
            
            addChild(taskViewController)
            self.view.addSubview(taskViewController.view)
            taskViewController.didMove(toParent: self)
            
            moveLeftButton.isHidden = true
            view.sendSubviewToBack(taskViewController.view)
        }
    }
    
    @objc func navigateRight() {
        if taskViewController.view.isDescendant(of: self.view) {
            taskViewController.view.removeFromSuperview()
        
            addChild(shopViewController)
            self.view.addSubview(shopViewController.view)
            shopViewController.didMove(toParent: self)
            
            moveLeftButton.isHidden = false
            view.sendSubviewToBack(shopViewController.view)
        } else if shopViewController.view.isDescendant(of: self.view) {
            shopViewController.view.removeFromSuperview()
            
            addChild(rewardViewController)
            self.view.addSubview(rewardViewController.view)
            rewardViewController.didMove(toParent: self)
            
            moveRightButton.isHidden = true
            view.sendSubviewToBack(rewardViewController.view)
        }
    }
    


}
