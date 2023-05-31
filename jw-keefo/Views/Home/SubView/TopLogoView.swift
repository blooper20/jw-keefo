//
//  TopLogoView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class TopLogoView: UIView {
    //MARK: - Declaration
    private  var logoImageView: UIImageView!
    
    //MARK: - Initailize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addLogoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TopLogoView {
    //MARK: - Constraints
    private func configure() {
        backgroundColor = .white
    }
    
    private func addLogoImageView() {
        logoImageView = UIImageView()
        let logoImage = UIImage(named: "top_navigation_logo")
        logoImageView.image = logoImage
        
        self.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.left.verticalEdges.equalToSuperview()
            make.height.equalTo(48)
        }
    }
}
