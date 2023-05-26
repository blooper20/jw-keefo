//
//  ScanTipView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class ScanTipView: UIView {
    
    //MARK: - Default Value
    private let contentTitleWidth = 149
    private let scanTipTitle = "스캔 TIP"
    private let contentTitleArray = [("", "수평을 맞춰서 스캔해주세요."),("", "어두울땐 플래시를 켜주세요.")]
    private let contentTitleFontSize = 14.0
    
    //MARK: - UI Component
    private lazy var scanTipTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = scanTipTitle
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    //MARK: - Initialize
        override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
            configureScanTip()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ScanTipView {
    //MARK: - Configure
    func configure() {
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.backgroundColor = .black.withAlphaComponent(0.8)
        self.addSubview(scanTipTitleLabel)
        scanTipTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
        }
        
        self.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(scanTipTitleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    
    func configureScanTip() {
        contentTitleArray.forEach { (image, contentTitle) in
            
            lazy var horizontalStackView: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .horizontal
                stackView.alignment = .fill //????? 맞나 이게
                
                return stackView
            }()
            
            lazy var contentIcon: UIImageView = {
                let imageView = UIImageView()
                imageView.image = UIImage(named: image)
                
                return imageView
            }()
            horizontalStackView.addArrangedSubview(contentIcon)
            contentIcon.snp.makeConstraints { make in
                make.width.equalTo(23)
                make.verticalEdges.equalToSuperview()
            }
            
            lazy var tipContent: UILabel = {
                let label = UILabel()
                label.text = contentTitle
                label.sizeToFit()
                label.textColor = .white
                label.font = .systemFont(ofSize: contentTitleFontSize, weight: .regular)
                
                return label
            }()
            horizontalStackView.addArrangedSubview(tipContent)
            tipContent.snp.makeConstraints { make in
                make.verticalEdges.equalToSuperview()
            }
            
            horizontalStackView.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
            
            self.verticalStackView.addArrangedSubview(horizontalStackView)
        }
    }
}
