//
//  ScanViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import LabCodeSDK
import SnapKit

class ScanViewController: DetectViewController {
    
    private var viewModel: ScanViewModel
    private var scanResponse: ScanResponse?
    
    //MARK: - UI Component
    private lazy var scanTipView = ScanTipView()
    
    
    //MARK: - Initialize
    init(viewModel: ScanViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: = View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        viewModel.getCheckingTicket()
        self.activateLabTracking(uniqueValue: "스냅태그")
        print("ScanViewController ViewDidLoad")
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

extension ScanViewController {
    //MARK: - Configure
    func configure() {
        self.view.addSubview(scanTipView)
        scanTipView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-36)
            //FIXME: - 동적으로 높이 넓이 변경
            make.width.equalTo(260)
            make.height.equalTo(150)
        }
        
    }
}

extension ScanViewController: DetectViewControllerProtocol {
    func abnormalExecution(reason: String) {
        
    }
    
    func getDetectResult(data: Dictionary<String, Any>) {
        
    }
}
