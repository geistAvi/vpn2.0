//
//  SpeedTestViewController.swift
//  VPN
//
//  Created by iMac on 23.05.2020.
//  Copyright © 2020 AlexAviJr. All rights reserved.
//

import UIKit

class SpeedTestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}

// MARK: -
// MARK: - Configure

private extension SpeedTestViewController {
    
    func configure() {
        configureGradient()
    }
    
    func configureGradient() {
        let layer0 = CAGradientLayer()
        layer0.colors = [UIColor(red: 0.318, green: 0.847, blue: 0.933, alpha: 1).cgColor,
                         UIColor(red: 0.071, green: 0.305, blue: 0.654, alpha: 1).cgColor]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1.33, b: 0.71, c: -0.71, d: 0.28, tx: 0.05, ty: 0.05))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        self.view.layer.insertSublayer(layer0, at: 0)
    }
    
}
