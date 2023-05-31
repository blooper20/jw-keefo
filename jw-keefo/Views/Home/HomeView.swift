//
//  HomeView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    var datum: [Datum]
    
    // MARK: - Default Value
    private let logoImageViewHeight = 48
    private let imageHeight = 367
    private let customTabBarHeight = 72
    
//MARK: - UI Component
    
    private lazy var topLogoView: TopLogoView = .init()
    private lazy var topImageBannerView: TopImageBannerView = .init()
    private var bottomEventBannerView: BottomEventBannerView
    private lazy var homeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
//MARK: - Initailize
    convenience init(datum: [Datum]) {
        self.init()
        self.datum = datum
        configure()
    }
    
    override init(frame: CGRect) {
        self.bottomEventBannerView = BottomEventBannerView()
        self.datum = [Datum].init()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

extension HomeView {
    //MARK: - Constraints
    private func configure() {
        bottomEventBannerView = BottomEventBannerView.init(datum: datum)
        backgroundColor = .white
        
        self.addSubview(topLogoView)
        topLogoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(logoImageViewHeight)

        }
        
        self.addSubview(homeScrollView)
        homeScrollView.snp.makeConstraints { make in
            make.top.equalTo(topLogoView.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalTo(self.snp.width)
        }
        
        
        self.homeScrollView.addSubview(topImageBannerView)
        topImageBannerView.snp.makeConstraints { make in
            make.height.equalTo(imageHeight)
            make.top.width.equalToSuperview()
        }

        self.homeScrollView.addSubview(bottomEventBannerView)
        self.bottomEventBannerView.snp.makeConstraints { make in
            make.top.equalTo(topImageBannerView.snp.bottom)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(270 + customTabBarHeight)
            make.bottom.equalToSuperview()
        }
    }

}
