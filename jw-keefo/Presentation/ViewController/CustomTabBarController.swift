//
//  CustomTabBarController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class CustomTabBarController: UITabBarController {
    
    //MARK: - Declaration
    var datum: [Datum]
    
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
        
        setUpTabBarShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        tabBar.unselectedItemTintColor = UIColor(hexCode: "#9d9d9d")
        
        tabBar.frame.size.height = 200.0
        tabBar.frame.origin.y = self.view.frame.size.height - 200.0
        tabBar.layer.cornerRadius = 24.0
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        
        if let tabBar = self.tabBarController?.tabBar {
            
            tabBar.frame.size.height = 200.0
            tabBar.frame.origin.y = self.view.frame.size.height - 200.0
        }
    }
    
    private func configureTapBarItem(tab: UIViewController, title: String, image: String, tag: Int) {
        tab.title = title
        tab.tabBarItem.image = UIImage(named: image)
        tab.tabBarItem.tag = tag
    }
    
    //MARK: - Setting
    private func setUpTabBarShadow() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.4
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowRadius = 4
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowPath = UIBezierPath(roundedRect: tabBar.bounds, cornerRadius: 24.0).cgPath
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
    
    //MARK: - Add View
    private func addCameraButtonView() {
        let scanTap = CameraButtonView(buttonImageName: "tabBar_camera")
        scanTap.cameraButton.addTarget(self, action: #selector(scanButtonTapped), for: .touchUpInside)
        
        self.tabBar.addSubview(scanTap)
        
        scanTap.snp.makeConstraints { make in
            make.centerX.equalTo(tabBar.snp.centerX)
            make.top.equalTo(tabBar.snp.top).offset(-8.0)
            make.height.equalTo(48.0)
            make.width.equalTo(52.0)
        }
    }
    //MARK: - Function
    private func presentScanViewController() {
        let scanViewModel = ScanViewModel()
        let scanViewController = ScanViewController(viewModel: scanViewModel)
        scanViewController.modalPresentationStyle = .fullScreen
        self.present(scanViewController, animated: true, completion: nil)
    }
    
    //MARK: - Selector
    @objc private func scanButtonTapped() {
        if let presentedViewController = self.presentedViewController {
            presentedViewController.dismiss(animated: false) {
                self.presentScanViewController()
            }
        } else {
            self.presentScanViewController()
        }
    }
}


