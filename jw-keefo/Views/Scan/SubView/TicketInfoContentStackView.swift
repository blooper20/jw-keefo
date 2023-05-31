//
//  TicketInfoStackView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/30.
//

import UIKit
import SnapKit

class TicketInfoContentStackView: UIStackView {
    
    var title: String
    var content: String
    
    var titleLabel: UILabel!
    var contentLabel: UILabel!

    //MARK: - Initialize
    convenience init(title: String, content: String) {
        self.init()
        self.title = title
        self.content = content
        configure()
        addTitleLabel()
        addContentLabel()
    }
    
    override init(frame: CGRect) {
        self.title = ""
        self.content = ""
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TicketInfoContentStackView {
    //MARK: - Configure
    func configure() {
        self.axis = .horizontal
        self.distribution = .equalCentering
        self.spacing = 30
    }
    
    //MARK: - Add View
    func addTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        
        self.addArrangedSubview(titleLabel)
    }

    func addContentLabel() {
        contentLabel = UILabel()
        contentLabel.text = content
        contentLabel.font = .systemFont(ofSize: 13, weight: .regular)
        contentLabel.textAlignment = .left
        contentLabel.sizeToFit()
        
        self.addArrangedSubview(contentLabel)
    }
}
