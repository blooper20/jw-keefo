//
//  NewsTitleSectionView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/22.
//

import UIKit
import SnapKit

class NewsTitleSectionView: UIView {
    //MARK: - Declaration
    private var eventLabel: UILabel!  
    private var viewAllButton: UIButton!
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addEventLabel()
        addViewAllButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsTitleSectionView {
    //MARK: - Add View
    private func addEventLabel() {
        eventLabel = UILabel()
        eventLabel.text = "이벤트 소식"
        eventLabel.textColor = .black
        eventLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        eventLabel.sizeToFit()
        
        self.addSubview(eventLabel)
        
        eventLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.verticalEdges.equalToSuperview()
        }
    }
    
    private func addViewAllButton() {
        viewAllButton = UIButton()
        viewAllButton.setTitle("전체보기", for: .normal)
        viewAllButton.setUnderline()
        viewAllButton.titleLabel?.textColor = UIColor(hexCode: "#d0cfcf")
        viewAllButton.titleLabel?.font = .systemFont(ofSize: 9.0, weight: .semibold)
        viewAllButton.titleLabel?.sizeToFit()
        
        self.addSubview(viewAllButton)
        
        viewAllButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.verticalEdges.equalToSuperview()
        }
    }
}
