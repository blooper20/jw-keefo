//
//  EntireEventCollectionViewCell.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class EntireEventCollectionViewCell: UICollectionViewCell {
    
    //    private var datum: Datum
    
    //MARK: - Default Value
    private lazy var eventImageRadius = 8.0
    private lazy var eventTitleLabelSize = 12.0
    private var tagHeight = 20
    private lazy var tagStackViewSpacing = 7.0
    private lazy var eventTitleLabelHeight = 40
    private lazy var scrollViewTopOffset = 10.0
    private lazy var eventTitleLabelTopOffset = 9.0
    
    //MARK: - UI Componenet
    private var tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top // alignment 변경
        stackView.distribution = .fill // distribution 변경
        
        return stackView
    }()
    
    private var horizontalScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    private lazy var eventImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = eventImageRadius
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: eventTitleLabelSize, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping // 단어 단위 줄 바꿈
        label.textAlignment = .left
        
        
        
        return label
    }()
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EntireEventCollectionViewCell {
    //MARK: - Constraints
    private func configure() {
        backgroundColor = .white
        
        self.addSubview(eventImageView)
        eventImageView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.addSubview(horizontalScrollView)
        horizontalScrollView.snp.makeConstraints { make in
            make.top.equalTo(eventImageView.snp.bottom).offset(scrollViewTopOffset)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(tagHeight)
        }
        
        self.addSubview(eventTitleLabel)
        eventTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom)
            make.bottom.horizontalEdges.equalToSuperview()
        }
        
        
        
    }
    //MARK: - Function
    private func binding(datum: Datum) {
        eventTitleLabel.text = datum.name
        urlToImage(urlString: datum.bannerImage) { image in
            
            DispatchQueue.main.async {
                if let image = image {
                    self.eventImageView.image = image
                } else {
                    self.eventImageView.image = UIImage()
                }
            }
        }
        
        
        datum.eventTag.forEach { event in
            let tagView = TagView(tagContent: event.tag)
            
            tagStackView.addArrangedSubview(tagView)
            tagView.snp.makeConstraints { make in
                make.height.equalTo(tagHeight)
            }
        }
        
        tagStackView.spacing = tagStackViewSpacing
        
        self.horizontalScrollView.addSubview(tagStackView)
        tagStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(eventTitleLabel)
        eventTitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom).offset(eventTitleLabelTopOffset)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(eventTitleLabelHeight)
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
