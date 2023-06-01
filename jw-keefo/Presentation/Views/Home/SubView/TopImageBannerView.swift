//
//  TopImageBannerView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TopImageBannerView: UIView {
    //MARK: - Declaration
    private var bannerImageView: UIImageView!
    private var keefoTextFirstLine: UIView!
    private var keefoFirstLabel: UILabel!
    private var keefoTextSecondLine: UIView!
    private var keefoSecondLabel: UILabel!
    private var keefoThirdLabel: UILabel!
    
    private var keefoFourthLabel: UILabel!
    
    
    private var shortcutButton: ShortcutButtonView!
        
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addImageView()
        addKeefoTextFirstLine()
        addKeefoFirstLabel()
        addKeefoTextSecondLine()
        addKeefoSecondLabel()
        addKeefoThirdLabel()
        addKeefoFourthLabel()
        addShortcutButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopImageBannerView {
    //MARK: - Add View
    private func addImageView() {
        bannerImageView = UIImageView()
        DispatchQueue.main.async {
            let image = UIImage(named: "home_banner")
            self.bannerImageView.image = image
        }
        bannerImageView.contentMode = .scaleAspectFill
        
        self.addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    private func addKeefoTextFirstLine() {
        keefoTextFirstLine  = UIView()
        keefoTextFirstLine.backgroundColor = .clear
        
        self.addSubview(keefoTextFirstLine)
        
        keefoTextFirstLine.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.top).offset(23)
            make.left.equalTo(bannerImageView.snp.left).offset(21)
        }
    }
    
    private func addKeefoFirstLabel() {
        keefoFirstLabel = UILabel()
        keefoFirstLabel.text = "키포에서만 가능한"
        keefoFirstLabel.numberOfLines = 1
        keefoFirstLabel.textColor = UIColor(hexCode: "#5B6780")
        keefoFirstLabel.font = .systemFont(ofSize: 16.0, weight: .semibold)
        keefoFirstLabel.sizeToFit()
        
        self.keefoTextFirstLine.addSubview(keefoFirstLabel)
        
        keefoFirstLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func addKeefoTextSecondLine() {
        keefoTextSecondLine = UIView()
        keefoTextSecondLine.backgroundColor = .clear

        self.addSubview(keefoTextSecondLine)
        
        keefoTextSecondLine.snp.makeConstraints { make in
            make.top.equalTo(keefoTextFirstLine.snp.bottom).offset(8)
            make.left.equalTo(bannerImageView.snp.left).offset(21)
        }
    }
    
    private func addKeefoSecondLabel() {
        keefoSecondLabel = UILabel()
        keefoSecondLabel.text = "나만의"
        keefoSecondLabel.numberOfLines = 1
        keefoSecondLabel.textColor = .black
        keefoSecondLabel.font = .systemFont(ofSize: 28.0, weight: .semibold)
        keefoSecondLabel.sizeToFit()
        
        self.keefoTextSecondLine.addSubview(keefoSecondLabel)
        
        keefoSecondLabel.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
        }
    }
    
    private func addKeefoThirdLabel() {
        keefoThirdLabel = UILabel()
        keefoThirdLabel.text = "디지털 티켓"
        keefoThirdLabel.numberOfLines = 1
        keefoThirdLabel.textColor = .black
        keefoThirdLabel.font = .systemFont(ofSize: 28.0, weight: .bold)
        keefoThirdLabel.sizeToFit()
        
        self.keefoTextSecondLine.addSubview(keefoThirdLabel)
        
        keefoThirdLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalTo(keefoSecondLabel.snp.right).offset(6)
        }
    }
    
    private func addKeefoFourthLabel() {
        keefoFourthLabel = UILabel()
        keefoFourthLabel.text = "만들기"
        keefoFourthLabel.numberOfLines = 1
        keefoFourthLabel.textColor = .black
        keefoFourthLabel.font = .systemFont(ofSize: 28.0, weight: .bold)
        keefoFourthLabel.sizeToFit()

        self.keefoTextSecondLine.addSubview(keefoFourthLabel)

        keefoFourthLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalTo(keefoThirdLabel.snp.right).offset(6)
        }
    }
    
    private func addShortcutButton() {
        shortcutButton = ShortcutButtonView()

        self.addSubview(shortcutButton)
        
        shortcutButton.snp.makeConstraints { make in
            make.bottom.equalTo(bannerImageView.snp.bottom).offset(-12)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(225)
            make.height.equalTo(48)
        }
    }
    
}
