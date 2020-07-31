//
//  ConnectViewController.swift
//  VPN
//
//  Created by iMac on 23.05.2020.
//  Copyright © 2020 AlexAviJr. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {

    // - UI
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var myView: UIView!
    
    // - Constraints
    @IBOutlet weak var myViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var myViewHeightConstraint: NSLayoutConstraint!
    
    
    // - Data
    private var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // - Action
    @IBAction func startButtonAction(_ sender: Any) {
        if index == 0 {
            statusLabel.text = String("Connected")
            statusLabel.textColor = .blue
            statusImageView.image = UIImage(named: "EllipseFull")
            index = index + 1
        } else if index == 1 {
            index = 0
            statusLabel.text = String("Disconnect")
            statusLabel.textColor = .red
            statusImageView.image = UIImage(named: "Ellipse")
        }
    }
    
//    @IBAction func curtainButtonAction(_ sender: Any) {
//        if myViewBottomConstraint.constant == 0 {
//            myViewHeightConstraint.constant = view.frame.height - 50
//            myViewBottomConstraint.constant = 10
//            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations:  { [weak self] in
//                self?.view.layoutSubviews()
//                }, completion: nil)
//        } else {
//            myViewBottomConstraint.constant = view.frame.height + 50
//            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: { [weak self] in
//                self?.view.layoutSubviews()
//                }, completion: nil)
//        }
//    }
}


// MARK: -
// MARK: - Configure

private extension ConnectViewController {
    
    func configure() {
        configureGradient()
//        configureMyView()
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
    
    func configureMyView() {
        myView.setGradientBackground(colorOne: #colorLiteral(red: 0.318, green: 0.847, blue: 0.933, alpha: 1), colorTwo: #colorLiteral(red: 0.071, green: 0.306, blue: 0.655, alpha: 1))
    }
    
}
