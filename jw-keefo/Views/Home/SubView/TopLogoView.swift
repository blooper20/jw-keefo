//
//  TopLogoView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TopLogoView: UIView {
    
// MARK: - Default Value
    private let logoImageViewHeight = 48

//MARK: - UI Component
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let logoImage = UIImage(named: "top_navigation_logo")
        imageView.image = logoImage
        return imageView
    }()
    
//MARK: - Initailize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopLogoView {
    //MARK: - Constraints
    private func configure() {
        backgroundColor = .white
        
        self.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
            make.height.equalTo(logoImageViewHeight)
        }
        
    }
    
}
