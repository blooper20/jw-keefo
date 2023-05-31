//
//  CameraButtonView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class CameraButtonView: UIView {
    
    //MARK: - Decalartion
    private var buttonImageName: String
    private let buttonBorderColor = UIColor(hexCode: "#a7a7f7")
    
    var cameraButton: UIButton!
    
    //MARK: - Initailize
    convenience init(buttonImageName: String) {
        self.init()
        self.buttonImageName = buttonImageName
        
        addCameraButton()
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
    //MARK: - Add View
    private func addCameraButton(){
        cameraButton = UIButton()
        cameraButton.backgroundColor = UIColor(hexCode: "#D3D3FB")
        cameraButton.layer.cornerRadius = 12.0
        cameraButton.layer.masksToBounds = true
        cameraButton.layer.borderColor = buttonBorderColor.cgColor
        cameraButton.layer.borderWidth = 2.0
        cameraButton.setImage(UIImage(named: buttonImageName), for: .normal)
        
        self.addSubview(cameraButton)
        
        cameraButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: - Setting
    private func setUpTabBarShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 12.0).cgPath
    }
}
