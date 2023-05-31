//
//  CameraButtonView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class CameraButtonView: UIView {
    
    private var buttonImageName: String
    
    //MARK: - Default Value
    private let buttonCornerRadius = 12.0
    private let buttonBorderWidth = 2.0
    private let buttonBackgroundColor = UIColor(hexCode: "#D3D3FB")
    private let buttonBorderColor = UIColor(hexCode: "#a7a7f7")
    
    //MARK: - UI Component
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = buttonBackgroundColor
        button.layer.cornerRadius = buttonCornerRadius
        button.layer.masksToBounds = true
        
        button.layer.borderColor = buttonBorderColor.cgColor
        button.layer.borderWidth = buttonBorderWidth
        
        return button
    }()
    
    //MARK: - Initailize
    convenience init(buttonImageName: String) {
        self.init()
        self.buttonImageName = buttonImageName
        configure()
    }
    
    override init(frame: CGRect) {
        self.buttonImageName = ""
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - View Cycle
    override func layoutSubviews() {
            super.layoutSubviews()
            setUpTabBarShadow()
        }
        
}
extension CameraButtonView {
    //MARK: - Configure
    private func configure() {
        button.setImage(UIImage(named: buttonImageName), for: .normal)
        
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUpTabBarShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: buttonCornerRadius).cgPath
    }
}
