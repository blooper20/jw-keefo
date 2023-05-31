//
//  ScanTipView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class ScanTipView: UIView {
    //MARK: - Declaration
    private let contentTitleArray = [("tip1", "수평을 맞춰서 스캔해주세요."),("tip2", "어두울땐 플래시를 켜주세요.")]
    private var scanTipTitleLabel: UILabel!
    private var verticalStackView: UIStackView!
    //MARK: - Initialize
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            configure()
            addScanTipTitleLabel()
            addVerticalStackView()
            configureScanTip()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}

extension ScanTipView {
    //MARK: - Configure
    private func configure() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.backgroundColor = .black.withAlphaComponent(0.8)
    }
    
    private func addScanTipTitleLabel() {
        scanTipTitleLabel = UILabel()
        scanTipTitleLabel.textColor = .white
        scanTipTitleLabel.text = "스캔 TIP"
        scanTipTitleLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)

        self.addSubview(scanTipTitleLabel)
        
        scanTipTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            make.height.equalTo(18)
        }
    }
    
    private func addVerticalStackView() {
        verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        
        self.addSubview(verticalStackView)
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(scanTipTitleLabel.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureScanTip() {
        contentTitleArray.forEach { (image, contentTitle) in
            
            lazy var horizontalStackView: UIStackView = {
                let stackView = UIStackView()
                stackView.axis = .horizontal
                stackView.spacing = 8
                
                return stackView
            }()
            DispatchQueue.main.async {
                lazy var contentIcon: UIImageView = {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: image)
                    imageView.contentMode = .scaleAspectFit
                    
                    return imageView
                }()
                
                horizontalStackView.addArrangedSubview(contentIcon)
                
                lazy var tipContent: UILabel = {
                    let label = UILabel()
                    label.text = contentTitle
                    label.sizeToFit()
                    label.textColor = UIColor(hexCode: "#767676")
                    label.font = .systemFont(ofSize: 14.0, weight: .regular)
                    
                    return label
                }()
                
                horizontalStackView.addArrangedSubview(tipContent)
            }
            
            horizontalStackView.snp.makeConstraints { make in
                make.height.equalTo(40)
            }
            
            self.verticalStackView.addArrangedSubview(horizontalStackView)
        }
    }
}
