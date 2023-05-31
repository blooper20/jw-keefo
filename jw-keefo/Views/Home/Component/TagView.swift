//
//  TagViewCellCollectionViewCell.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TagView: UIView {
    //MARK: - Declaration
    private var tagContent: String
    private var tagTitle: UILabel!
    
    //MARK: - Initialize
    convenience init(tagContent: String) {
        self.init()
        self.tagContent = tagContent
        
        configure()
        addTagTitle()
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
    //MARK: - Configure
    private func configure() {
        self.backgroundColor = UIColor(hexCode: "#eaeaea")
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
    }
    
    
    //MARK: - Add View
    private func addTagTitle() {
        tagTitle = UILabel()
        tagTitle.text = "#\(tagContent)"
        tagTitle.font = .systemFont(ofSize: 11.0, weight: .regular)
        tagTitle.textColor = .black
        tagTitle.numberOfLines = 1
        
        self.addSubview(tagTitle)
        
        tagTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(2)
            make.height.equalTo(16)
        }
    }
    
    private func adjustTitleLabelSize() {
        let fittingSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat(16))
        let size = tagTitle.sizeThatFits(fittingSize)
        
        tagTitle.snp.remakeConstraints { make in
            make.width.equalTo(size.width)
            make.verticalEdges.equalToSuperview().inset(2)
            make.horizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(16)
        }
    }
    
}
