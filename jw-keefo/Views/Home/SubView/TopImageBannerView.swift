//
//  TopImageBannerView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TopImageBannerView: UIView {
    
    // MARK: - Default Value
    private let buttonWidth = 225
    private let buttonHeight = 48
    private let buttonBottomOffset = 12
    
    private let keefoLabelFirstText = "키포에서만 가능한"
    private let keefoLabelSecondText = "나만의"
    private let keefoLabelThirdText = "디지털 티켓"
    private let keefoLabelFourthText = "만들기"
    private let keefoFirstLineFontSize = 16.0
    private let keefoSecondLineFontSize = 28.0
    private let keefoSecondLineSpaceOffset = 6
    private let keefoLineSpaceOffset = 8
    private let keefoTextSecondLineLeftOffset = 21
    private let keefoTextLineLeftOffset = 21
    private let keefoTextFirstLineTopOffset = 23
    
    //MARK: - UI Component
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "home_banner")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var keefoFirstLabel: UILabel = {
        let label = UILabel()
        label.text = keefoLabelFirstText
        label.numberOfLines = 1
        label.textColor = UIColor(hexCode: "#5B6780")
        label.font = .systemFont(ofSize: keefoFirstLineFontSize, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var keefoSecondLabel: UILabel = {
        let label = UILabel()
        label.text = keefoLabelSecondText
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: keefoSecondLineFontSize, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var keefoThirdLabel: UILabel = {
        let label = UILabel()
        label.text = keefoLabelThirdText
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: keefoSecondLineFontSize, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var keefoFourthLabel: UILabel = {
        let label = UILabel()
        label.text = keefoLabelFourthText
        label.numberOfLines = 1
        label.textColor = .black
        label.font = .systemFont(ofSize: keefoSecondLineFontSize, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var keefoTextFirstLine: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var keefoTextSecondLine: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var shortcutButton: ShortcutButtonView = {
        let view = ShortcutButtonView()
        
        return view
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

extension TopImageBannerView {
    //MARK: - Constraints
    func configure() {
        self.addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        self.addSubview(keefoTextFirstLine)
        keefoTextFirstLine.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.top).offset(keefoTextFirstLineTopOffset)
            make.left.equalTo(bannerImageView.snp.left).offset(keefoTextLineLeftOffset)
        }
        
        self.addSubview(keefoTextSecondLine)
        keefoTextSecondLine.snp.makeConstraints { make in
            make.top.equalTo(keefoTextFirstLine.snp.bottom).offset(keefoLineSpaceOffset)
            make.left.equalTo(bannerImageView.snp.left).offset(keefoTextLineLeftOffset)
        }
        
        self.keefoTextFirstLine.addSubview(keefoFirstLabel)
        keefoFirstLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.keefoTextSecondLine.addSubview(keefoSecondLabel)
        keefoSecondLabel.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
        }
        
        self.keefoTextSecondLine.addSubview(keefoThirdLabel)
        keefoThirdLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalTo(keefoSecondLabel.snp.right).offset(keefoSecondLineSpaceOffset)
        }
        
        self.keefoTextSecondLine.addSubview(keefoFourthLabel)
        keefoFourthLabel.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalTo(keefoThirdLabel.snp.right).offset(keefoSecondLineSpaceOffset)
        }
        
        self.addSubview(shortcutButton)
        shortcutButton.snp.makeConstraints { make in
            make.bottom.equalTo(bannerImageView.snp.bottom).offset(-buttonBottomOffset)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(buttonWidth) // 여기
            make.height.equalTo(buttonHeight)
        }
    }
}
