//
//  BottomEventBannerView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class BottomEventBannerView: UIView {
    //MARK: - Declaration
    private var datum: [Datum]
    private var newsTitleSectionView: NewsTitleSectionView!
    private var entireEventCollectionView: UICollectionView!

    //MARK: - Initialize
    convenience init(datum: [Datum]) {
        self.init()
        self.datum = datum
        
        addNewsTitleSectionView()
        addEntireEventCollectionView()
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
    //MARK: - Add View
    private func addNewsTitleSectionView() {
        newsTitleSectionView = NewsTitleSectionView()
        
        self.addSubview(newsTitleSectionView)
        
        newsTitleSectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(24)
        }
    }
    
    private func addEntireEventCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 176, height: 180)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: .zero, left: 15.0, bottom: .zero, right: 15.0)
        
        entireEventCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        entireEventCollectionView.dataSource = self
        entireEventCollectionView.register(EntireEventCollectionViewCell.self, forCellWithReuseIdentifier: "entireEventCollectionViewIdentifier")
        entireEventCollectionView.showsVerticalScrollIndicator = false
        entireEventCollectionView.showsHorizontalScrollIndicator = false
        
        self.addSubview(entireEventCollectionView)
        
        entireEventCollectionView.snp.makeConstraints { make in
            make.top.equalTo(newsTitleSectionView.snp.bottom).offset(13)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(CGSize.init(width: 176, height: 180).height)
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
