//
//  TagViewCellCollectionViewCell.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TagView: UIView {
    
// MARK: - Default Value
    private var tagContent: String
    private let tagTitleSize = 11.0
    private let tagTitleLabelHeight = 16
    private let tagTitleLabelVerticalEdgesInset = 2
    private let tagTitleLabelHorizontalEdgesInset = 8
    
//MARK: - UI Component
    
    private lazy var tagTitle: UILabel = {
        let label = UILabel()
        label.text = "#\(tagContent)"
        label.font = .systemFont(ofSize: tagTitleSize, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 1
        
        return label
    }()
    
//MARK: - Initialize
    convenience init(tagContent: String) {
        self.init()
        self.tagContent = tagContent
        configure()
        adjustTitleLabelSize()
    }
    
    override init(frame: CGRect) {
        self.tagContent = ""
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagView {
    //MARK: - Constraints
    private func configure() {
        self.backgroundColor = UIColor(hexCode: "#eaeaea")
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        
        self.addSubview(tagTitle)
        tagTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(tagTitleLabelVerticalEdgesInset)
            make.height.equalTo(tagTitleLabelHeight)
        }
    }
    
    private func adjustTitleLabelSize() {
        let fittingSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat(tagTitleLabelHeight))
        let size = tagTitle.sizeThatFits(fittingSize)
        
        tagTitle.snp.remakeConstraints { make in
            make.width.equalTo(size.width)
            make.verticalEdges.equalToSuperview().inset(tagTitleLabelVerticalEdgesInset)
            make.horizontalEdges.equalToSuperview().inset(tagTitleLabelHorizontalEdgesInset)
            make.height.equalTo(tagTitleLabelHeight)
        }
    }

}
