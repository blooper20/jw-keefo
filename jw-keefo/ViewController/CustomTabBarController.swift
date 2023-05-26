//
//  CustomTabBarController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class CustomTabBarController: UITabBarController {
    
    var datum: [Datum]
    
    //MARK: - Default Value
    private let tabBarHeight = 200.0
    private let tabBarCornerRadius = 24.0
    private var bottomMargin = 32
    private let buttonWidth = 52.0
    private let buttonHeight = 48.0
    private let buttonTopOffset = 8.0
    
    //MARK: - Initialize
    init(datum: [Datum]) {
        self.datum = datum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewCycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupTabBarShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CustomTabBarController ViewDidLoad")
        setTabBar()
        configure()
        addCameraButtonView()
        
    }
    
}

extension CustomTabBarController {
    //MARK: - Configure
    private func configure() {
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .systemGray5
        
        tabBar.frame.size.height = tabBarHeight
        tabBar.frame.origin.y = self.view.frame.size.height - tabBarHeight
        tabBar.layer.cornerRadius = tabBarCornerRadius
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        
        if let tabBar = self.tabBarController?.tabBar {
            
            tabBar.frame.size.height = tabBarHeight
            tabBar.frame.origin.y = self.view.frame.size.height - tabBarHeight
        }
    }
    
    private func setupTabBarShadow() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.4
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowPath = UIBezierPath(roundedRect: tabBar.bounds, cornerRadius: tabBarCornerRadius).cgPath
    }
    
    private func setTabBar() {
        
        let homeVC = HomeViewController(datum: datum)
        
        let shopVC = UIViewController()
        
        let scanVC = UIViewController()
        scanVC.tabBarItem.isEnabled = false
        
        let rankVC = UIViewController()
        
        let myPageVC = UIViewController()
        
        configureTapBarItem(tab: homeVC, title: "Home", image: "homePage", tag: 0)
        configureTapBarItem(tab: shopVC, title: "Shop", image: "shopPage", tag: 1)
        configureTapBarItem(tab: rankVC, title: "Rank", image: "rankPage", tag: 2)
        configureTapBarItem(tab: myPageVC, title: "My", image: "myPage", tag: 3)
        
        setViewControllers([homeVC, shopVC, scanVC, rankVC, myPageVC], animated: true)
    }
    
    func addCameraButtonView() {
        let scanTap = CameraButtonView(buttonImageName: "tabBar_camera")
        
        scanTap.button.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        
        self.tabBar.addSubview(scanTap)
        scanTap.snp.makeConstraints { make in
            make.centerX.equalTo(tabBar.snp.centerX)
            make.top.equalTo(tabBar.snp.top).offset(-buttonTopOffset)
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
        }
    }
    
    private func configureTapBarItem(tab: UIViewController, title: String, image: String, tag: Int) {
        tab.title = title
        tab.tabBarItem.image = UIImage(named: image)
        tab.tabBarItem.tag = tag
    }
    
    @objc private func scanButtonTapped() {
        if let presentedViewController = self.presentedViewController {
                presentedViewController.dismiss(animated: false) {
                    self.presentScanViewController()
                }
            } else {
                self.presentScanViewController()
            }
//        let scanViewController = ScanViewController()
//        self.present(scanViewController, animated: true, completion: nil)
//
//        guard let rootViewController = self.view.window?.rootViewController else { return }
//        rootViewController.present(scanViewController, animated: true)
//        scanViewController.modalTransitionStyle = .flipHorizontal
//        scanViewController.modalPresentationStyle = .fullScreen
//
////        self.navigationController?.pushViewController(scanViewController, animated: true) : - 왜 안되나요?
//
//        print("TAP!!!")
    }
    
    private func presentScanViewController() {
        let scanViewController = ScanViewController()
        scanViewController.modalPresentationStyle = .fullScreen
        self.present(scanViewController, animated: true, completion: nil)
        print("TAP!!!")
    }
}


