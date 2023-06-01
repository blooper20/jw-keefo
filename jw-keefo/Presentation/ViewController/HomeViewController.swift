//
//  HomeViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    //MARK: - Declaration
    private var homeView: HomeView!
    private var datum: [Datum]
    
    // MARK: Initializer
    init(datum: [Datum]) {
        self.datum = datum
        self.homeView = HomeView(datum: datum)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHomeView()
    }
}

extension HomeViewController {
    //MARK: - Add View
    private func addHomeView() {
        homeView = HomeView(datum: datum)
        
        self.view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
