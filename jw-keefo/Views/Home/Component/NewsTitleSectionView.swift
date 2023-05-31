//
//  NewsTitleSectionView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/22.
//

import UIKit
import SnapKit

class NewsTitleSectionView: UIView {
    
    //MARK: - Default Value
    private let eventLabelTitle = "이벤트 소식"
    private let eventLabelSize = 20.0
    private let eventLabelOffset = 16
    
    private let viewAllButtonTitle = "전체보기"
    private let viewAllButtonTitleSize = 9.0
    private let viewAllButtonOffset = 12
    
    //MARK: - UI Component
    private lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = eventLabelTitle
        label.textColor = .black
        label.font = .systemFont(ofSize: eventLabelSize, weight: .semibold)
        label.sizeToFit()
        
        return label
    }()
    
    private lazy var viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle(viewAllButtonTitle, for: .normal)
        button.setUnderline()
        button.titleLabel?.textColor = UIColor(hexCode: "#d0cfcf")
        button.titleLabel?.font = .systemFont(ofSize: viewAllButtonTitleSize, weight: .semibold)
        button.titleLabel?.sizeToFit()
        
        return button
    }()
    
    //MARK: - Initialize
    //    convenience init() {
    //        self.init()
    //        configure()
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsTitleSectionView {
    //MARK: - Constraints
    private func configure() {
        self.addSubview(eventLabel)
        eventLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(eventLabelOffset)
            make.verticalEdges.equalToSuperview()
        }
        
        self.addSubview(viewAllButton)
        viewAllButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-viewAllButtonOffset)
            make.verticalEdges.equalToSuperview()
        }
    }
}
