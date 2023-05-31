//
//  HomeView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    
    //MARK: - Declaration
    var datum: [Datum]
    private var topLogoView: TopLogoView!
    private var homeScrollView: UIScrollView!
    private var topImageBannerView: TopImageBannerView!
    private var bottomEventBannerView: BottomEventBannerView
    
    
    
    //MARK: - Initailize
    convenience init(datum: [Datum]) {
        self.init()
        self.datum = datum
        
        configure()
        addTopLogoView()
        addHomeScrollView()
        addTopImageBannerView()
        addBottomEventBannerView()
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
    //MARK: - Configure
    private func configure() {
        self.backgroundColor = .white
    }
    
    //MARK: - Add View
    private func addTopLogoView() {
        topLogoView = TopLogoView()
        
        self.addSubview(topLogoView)
        
        topLogoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(48)
        }
    }
    
    private func addHomeScrollView() {
        homeScrollView = UIScrollView()
        homeScrollView.isScrollEnabled = true
        homeScrollView.showsVerticalScrollIndicator = false
        homeScrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(homeScrollView)
        
        homeScrollView.snp.makeConstraints { make in
            make.top.equalTo(topLogoView.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalTo(self.snp.width)
        }
    }
    
    private func addTopImageBannerView() {
        topImageBannerView = TopImageBannerView()
        
        self.homeScrollView.addSubview(topImageBannerView)
        
        topImageBannerView.snp.makeConstraints { make in
            make.height.equalTo(367)
            make.top.width.equalToSuperview()
        }
    }
    
    private func addBottomEventBannerView() {
        bottomEventBannerView = BottomEventBannerView.init(datum: datum)
        
        self.homeScrollView.addSubview(bottomEventBannerView)
        
        self.bottomEventBannerView.snp.makeConstraints { make in
            make.top.equalTo(topImageBannerView.snp.bottom)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(270 + 72)
            make.bottom.equalToSuperview()
        }
    }
    
}
