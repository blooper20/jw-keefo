//
//  EntireEventCollectionViewCell.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class EntireEventCollectionViewCell: UICollectionViewCell {
    //MARK: - Declaration
    private var tagStackView: UIStackView!
    private var horizontalScrollView: UIScrollView!
    private var eventImageView: UIImageView!
    private var eventTitleLabel: UILabel!
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        addTagStackView()
        addEventImageView()
        addHorizontalScrollView()
        addEventTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EntireEventCollectionViewCell {
    //MARK: - Constraints
    private func configure() {
        backgroundColor = .white
    }
    
    //MARK: - Add View
    private func addTagStackView() {
        tagStackView = UIStackView()
        tagStackView.axis = .horizontal
        tagStackView.alignment = .top
        tagStackView.distribution = .fill
    }
    
    private func addEventImageView() {
        eventImageView = UIImageView()
        eventImageView.layer.cornerRadius = 8.0
        eventImageView.layer.masksToBounds = true
        
        self.addSubview(eventImageView)
        
        eventImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func addHorizontalScrollView() {
        horizontalScrollView = UIScrollView()
        horizontalScrollView.isScrollEnabled = true
        horizontalScrollView.showsVerticalScrollIndicator = false
        horizontalScrollView.showsHorizontalScrollIndicator = false
        
        self.addSubview(horizontalScrollView)
        
        horizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(eventImageView.snp.bottom).offset(10.0)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(20)
        }
    }

    private func addEventTitleLabel() {
        eventTitleLabel = UILabel()
        eventTitleLabel.font = .systemFont(ofSize: 12.0, weight: .semibold)
        eventTitleLabel.numberOfLines = 0
        eventTitleLabel.lineBreakMode = .byWordWrapping
        eventTitleLabel.textAlignment = .left
        
        self.addSubview(eventTitleLabel)
        
        eventTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom)
            make.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    //MARK: - Function
    func binding(datum: Datum) {
        eventTitleLabel.text = datum.name
        urlToImage(urlString: datum.bannerImage) { image in
            
            DispatchQueue.main.async {
                if let image = image {
                    self.eventImageView.image = image
                } else {
                    self.eventImageView.image = UIImage()
                    // 이미지를 못받아왔을 경우에 사용되는 로직 작성
                }
            }
        }
        
        datum.eventTag.forEach { event in
            let tagView = TagView(tagContent: event.tag)
            
            tagStackView.addArrangedSubview(tagView)
            
            tagView.snp.makeConstraints { make in
                make.height.equalTo(20)
            }
        }
        
        tagStackView.spacing = 7.0
        
        self.horizontalScrollView.addSubview(tagStackView)
        tagStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(eventTitleLabel)
        
        eventTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom).offset(9.0)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func urlToImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
}
