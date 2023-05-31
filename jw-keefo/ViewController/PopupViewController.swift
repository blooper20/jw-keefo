//
//  PopupViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class PopupViewController: UIViewController {
    
    private var scanResponse: ScanResponse!
    var succesScanPopUpView: SuccesScanPopUpView!
    var snapShotView: UIView!
    var dimView: UIView!
    
    
    //MARK: - Initialize
    init(snapShotView: UIView, scanResponse: ScanResponse) {
        self.snapShotView = snapShotView
        self.scanResponse = scanResponse
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addDimView()
        addSuccesScanPopUpView()
    }
    
    func configure() {
        
        self.view.addSubview(snapShotView)
        
        snapShotView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addDimView() {
        dimView = UIView()
        dimView.backgroundColor = .black.withAlphaComponent(0.8)
        
        self.snapShotView.addSubview(dimView)
        
        dimView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func addSuccesScanPopUpView() {
        succesScanPopUpView = SuccesScanPopUpView(scanResponse: scanResponse)
        
        self.snapShotView.addSubview(succesScanPopUpView)
        
        succesScanPopUpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(10)
            make.height.equalTo(300)
            make.horizontalEdges.equalToSuperview().inset(45)
        }
    }
    
}
