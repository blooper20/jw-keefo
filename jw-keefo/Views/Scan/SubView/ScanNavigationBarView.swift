//
//  ScanNavigationBarView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/30.
//

import UIKit
import SnapKit

class ScanNavigationBarView: UIView {
    
    //MARK: - UI Component
    lazy var backButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "chevron.backward")
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .black
        
        return button
    }()
    
    lazy var adminModeLabel: UILabel = {
        let label = UILabel()
        label.text = "관리자 모드"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.layer.cornerRadius = 6
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.textColor = .red
        label.backgroundColor = .black
        label.sizeToFit()
        
        return label
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScanNavigationBarView {
    //MARK: - Configure
    private func configure() {
        self.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.verticalEdges.equalToSuperview()
            make.width.equalTo(25)
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(adminModeLabel)
        adminModeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.verticalEdges.equalToSuperview()
            make.width.equalToSuperview().inset(115)
        }
    }
}
