//
//  ScanCheckNoticeStackView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/30.
//

import UIKit
import SnapKit

class ScanCheckNoticeStackView: UIStackView {
    
    private var checkingLabel: UILabel!
    private var checkingIcon: UIImageView!
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addCheckingLabel()
        addCheckingIcon()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ScanCheckNoticeStackView {
    //MARK: - Configure
    private func configure() {
        self.backgroundColor = .clear
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 2.5
    }
    
    //MARK: - Add View
    private func addCheckingLabel() {
        checkingLabel = UILabel()
        checkingLabel.text = "입장 확인 완료"
        checkingLabel.font = .systemFont(ofSize: 18, weight: .bold)
        checkingLabel.sizeToFit()
        
        self.addArrangedSubview(checkingLabel)
    }
    
    private func addCheckingIcon() {
        checkingIcon = UIImageView()
        checkingIcon.image = UIImage(named: "check_circle")
        checkingIcon.contentMode = .scaleAspectFit
        
        self.addArrangedSubview(checkingIcon)
    }
}
