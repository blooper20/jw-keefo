//
//  BottomEventBannerView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class BottomEventBannerView: UIView {
    
    private var datum: [Datum]
    
    //MARK: - Default Value
    private let newsTitleSectionViewOffset = 20
    private let newsTitleSectionViewHeight = 24
    private let entireEventCollectionViewTopOffset = 13
    private let collectionViewCellSize = CGSize.init(width: 176, height: 180)
    private let collectionViewsectionInset = 15.0
    
    
    //MARK: - UI Component
    private lazy var newsTitleSectionView: NewsTitleSectionView = .init()
    
    private lazy var entireEventCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = collectionViewCellSize
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: .zero, left: collectionViewsectionInset, bottom: .zero, right: collectionViewsectionInset)
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(EntireEventCollectionViewCell.self, forCellWithReuseIdentifier: "entireEventCollectionViewIdentifier")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    private lazy var horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    
    //MARK: - Initialize
    convenience init(datum: [Datum]) {
        self.init()
        self.datum = datum
        configure()
    }

    override init(frame: CGRect) {
        self.datum = [Datum]()
        super.init(frame: frame)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomEventBannerView {
    //MARK: - Constraints
    func configure() {
        self.addSubview(newsTitleSectionView)
        newsTitleSectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(newsTitleSectionViewOffset)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(newsTitleSectionViewHeight)
        }
        
        self.addSubview(entireEventCollectionView)
        entireEventCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newsTitleSectionView.snp.bottom).offset(entireEventCollectionViewTopOffset)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(collectionViewCellSize.height)
        }
    }
}

extension BottomEventBannerView: UICollectionViewDataSource  {
    //MARK: = DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "entireEventCollectionViewIdentifier", for: indexPath) as? EntireEventCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.binding(datum: datum[indexPath.row])
        return cell
    }
}
