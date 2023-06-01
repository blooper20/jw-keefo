//
//  ShortcutButtonView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/26.
//

import UIKit

import SnapKit

class ShortcutButtonView: UIView {
    //MARK: - Declaration
    private var buttonStackView: UIStackView!
    private var titleLabel: UILabel!
    private var buttonIcon: UIImageView!
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addButtonStackView()
        addTitleLabel()
        addButtonIcon()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShortcutButtonView {
    //MARK: - Configure
    private func configure() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 12.0
        self.layer.masksToBounds = true
    }
    
    //MARK: - Add View
    private func addButtonStackView() {
        buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .firstBaseline
        
        self.addSubview(buttonStackView)
        
        buttonStackView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-24.81)
        }
    }
    
    private func addTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "바로가기"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 16.0, weight: .semibold)
        titleLabel.numberOfLines = 1
        titleLabel.sizeToFit()
        
        self.buttonStackView.addArrangedSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
    }
    
    private func addButtonIcon() {
        let buttonIcon = UIImageView()
        let buttonIconimage = UIImage(systemName: "arrow.right")
        buttonIcon.image = buttonIconimage
        buttonIcon.tintColor = .white
        buttonIcon.contentMode = .scaleAspectFit
        
        self.buttonStackView.addArrangedSubview(buttonIcon)
        
        buttonIcon.snp.makeConstraints { make in
            make.width.equalTo(14.38)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Function
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    //MARK: - Selector
    @objc func handleTap(sender: UITapGestureRecognizer) {
        //FIXME: - 티켓 만들기로 넘어가는 뷰
        print("Tapped!!!")
    }
}
