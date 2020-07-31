//
//  TabBarViewController.swift
//  VPN
//
//  Created by iMac on 23.05.2020.
//  Copyright © 2020 AlexAvi All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: -
// MARK: - Configure

private extension TabBarViewController {
    
    func configure() {
        configureViewControllers()
    }
    
    func configureViewControllers() {
        let connectVC = UIStoryboard(name: "Connect", bundle: nil).instantiateInitialViewController() as! ConnectViewController
        let connectTabBarItem = UITabBarItem()
        connectTabBarItem.image = UIImage(named: "Connect")
        connectTabBarItem.selectedImage = UIImage(named: "Connect")
        connectTabBarItem.title = "Connect"
        connectVC.tabBarItem = connectTabBarItem
        
        let settingVC = UIStoryboard(name: "Setting", bundle: nil).instantiateInitialViewController() as! SettingViewController
        let settingTabBarItem = UITabBarItem()
        settingTabBarItem.image = UIImage(named: "Setting")
        settingTabBarItem.selectedImage = UIImage(named: "Setting")
        settingTabBarItem.title = "Settings"
        settingVC.tabBarItem = settingTabBarItem
        
        let speedTestVC = UIStoryboard(name: "SpeedTest", bundle: nil).instantiateInitialViewController() as! SpeedTestViewController
        let speedTestTabBarItem = UITabBarItem()
        speedTestTabBarItem.image = UIImage(named: "SpeedTest")
        speedTestTabBarItem.selectedImage = UIImage(named: "SpeedTest")
        speedTestTabBarItem.title = "Speed Test"
        speedTestVC.tabBarItem = speedTestTabBarItem
        
        viewControllers = [speedTestVC, connectVC, settingVC]
    }
    
}
