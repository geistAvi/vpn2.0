//
//  VpnViewController.swift
//  VPN
//
//  Created by iMac on 14.05.2020.
//  Copyright © 2020 AlexAviJr. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // - Data
    private var screens = [OnboardingViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        var indexPath = IndexPath (row: 0, section: 0)
        if pageControl.currentPage == 0 {
            pageControl.currentPage = 1
            indexPath.row = 1
            collectionView.scrollToItem (at: indexPath, at: .right, animated: true)
        } else if pageControl.currentPage == 1 {
            pageControl.currentPage = 2
            indexPath.row = 2
            collectionView.scrollToItem (at: indexPath, at: .right, animated: true)
        } else {
            pageControl.currentPage = 3
            let vc = TabBarViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
}

// MARK: -
// MARK: - Configure Collection View Data Source

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        let screen = screens[indexPath.row]
        cell.logoImageView.image = UIImage(named: screen.image)
        cell.logo2ImageView.image = UIImage(named: screen.image2)
        cell.textLabel.text = screen.text
        return cell
    }
    
}

// MARK: -
// MARK: - Configure Collection View Delegate

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        return CGSize(width: width, height: height)
    }
    
}

// MARK: -
// MARK: - Configure

private extension OnboardingViewController {
    
    func configure() {
        configureGradient()
        configureCollectionView()
        configureScreens()
        configurePageControl()
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
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func configureScreens() {
        let sc1 = OnboardingViewModel(image: "shieldVpn", image2: "", text: "Surf the internet without limits")
        let sc2 = OnboardingViewModel(image: "window", image2: "wifi", text: "Enjoy fast and stable connection")
        let sc3 = OnboardingViewModel(image: "all", image2: "", text: "Choose safe VPN connection")
        
        screens = [sc1, sc2, sc3]
    }
    
    func configurePageControl() {
        pageControl.numberOfPages = 3
    }
    
}
