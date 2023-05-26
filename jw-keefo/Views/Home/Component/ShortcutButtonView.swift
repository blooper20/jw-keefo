//
//  ShortcutButtonView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/26.
//

import UIKit

import SnapKit

class ShortcutButtonView: UIView {
    
    //MARK: - Default Value
    private let buttonRadius = 12.0
    
    private let title = "바로가기"
    private let titleSize = 16.0
    private let titleLabelOffset = 22
    
    private let buttonIconOffset = 24.81
    private let buttonIconWidth = 14.38
    
    //MARK: - UI Component
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .firstBaseline
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.textColor = .white
        label.font = .systemFont(ofSize: titleSize, weight: .semibold)
        label.numberOfLines = 1
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var buttonIcon: UIImageView = {
        let image = UIImage(systemName: "arrow.right")
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ShortcutButtonView {
    //MARK: - Configure
    func configure() {
        self.layer.cornerRadius = buttonRadius
        self.layer.masksToBounds = true
        self.backgroundColor = .black
        
        self.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalToSuperview().offset(titleLabelOffset)
            make.right.equalToSuperview().offset(-buttonIconOffset)
        }
        
        self.buttonStackView.addArrangedSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
        
        self.buttonStackView.addArrangedSubview(buttonIcon)
        buttonIcon.snp.makeConstraints { make in
            make.width.equalTo(buttonIconWidth)
            make.centerY.equalToSuperview()
        }
    }
    
    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: - Selector
    @objc func handleTap(sender: UITapGestureRecognizer) {
            print("Tapped!!!")
        }
}
