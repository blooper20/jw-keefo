//
//  ScanNavigationBarView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/30.
//

import UIKit
import SnapKit

class ScanNavigationBarView: UIView {
    
    //MARK: - Declaration
    var backButton: UIButton!
    var adminModeLabel: UILabel!
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addBackButton()
        addAdminModeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScanNavigationBarView {
    //MARK: - Add View
    private func addBackButton() {
        backButton = UIButton()
        let image = UIImage(systemName: "chevron.backward")
        backButton.setImage(image, for: .normal)
        backButton.imageView?.tintColor = .black
        
        self.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.verticalEdges.equalToSuperview()
            make.width.equalTo(25)
            make.centerY.equalToSuperview()
        }
    }
    
    private func addAdminModeLabel() {
        adminModeLabel = UILabel()
        adminModeLabel.text = "관리자 모드"
        adminModeLabel.font = .systemFont(ofSize: 14, weight: .bold)
        adminModeLabel.layer.cornerRadius = 6
        adminModeLabel.layer.masksToBounds = true
        adminModeLabel.textAlignment = .center
        adminModeLabel.textColor = .red
        adminModeLabel.backgroundColor = .black
        adminModeLabel.sizeToFit()
        
        self.addSubview(adminModeLabel)
        
        adminModeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.verticalEdges.equalToSuperview()
            make.width.equalToSuperview().inset(115)
        }
    }
}
