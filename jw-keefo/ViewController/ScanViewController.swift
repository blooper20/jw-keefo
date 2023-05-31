//
//  ScanViewController.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import LabCodeSDK
import SnapKit
import AVKit

class ScanViewController: DetectViewController {
    //MARK: - Declaration
    private var viewModel: ScanViewModel
    private var scanResponse: ScanResponse!
    private let zoomOnImage: UIImage! = UIImage(named: "zoom_on_admin")
    private let zoomOffImage: UIImage! = UIImage(named: "zoom_off_admin")
    private let torchOnImage: UIImage! = UIImage(named: "torch_on_admin")
    private let torchoffImage: UIImage! = UIImage(named: "torch_off_admin")
    
    private var scanNavigationBarView: ScanNavigationBarView!
    private var torchButton: UIButton!
    private var zoomButton: UIButton!
    private var horizontalStackView: UIStackView!
    private var scanAim: UIImageView!
    private var scanFrame: UIImageView!
    private var scanFrameDot: UIImageView!
    private var scanTipView: ScanTipView!
    
    
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
        self.activateLabTracking(uniqueValue: "스냅태그")
        
        addScanNavigationBarView()
        addHorizontalStackView()
        addTorchButton()
        addZoomButton()
        addScanAim()
        addScanFrame()
        addScanFrameDot()
        addScanTipView()
        addTapTarget()
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
    private func configure() {
        self.setSoundStatus(value: true)
        self.setVibrationStatus(value: true)
    }
    
    //MARK: - Add View
    private func addScanNavigationBarView() {
        scanNavigationBarView = ScanNavigationBarView()
        
        self.view.addSubview(scanNavigationBarView)
        
        scanNavigationBarView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    
    private func addHorizontalStackView() {
        horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalCentering
        
        self.view.addSubview(horizontalStackView)
        
        horizontalStackView.snp.makeConstraints { make in
            make.width.equalTo(scanNavigationBarView.adminModeLabel.snp.width)
            make.height.equalTo(42)
            make.top.equalTo(scanNavigationBarView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
    }
    
    private func addTorchButton() {
        torchButton = UIButton()
        torchButton.setImage(torchOnImage, for: .normal)
        torchButton.addTarget(self, action: #selector(tapTorchButton), for: .touchUpInside)
        
        horizontalStackView.addArrangedSubview(torchButton)
        
        torchButton.snp.makeConstraints { make in
            make.width.height.equalTo(42)
        }
    }
    
    private func addZoomButton() {
        zoomButton = UIButton()
        zoomButton.setImage(zoomOnImage, for: .normal)
        zoomButton.addTarget(self, action: #selector(tapZoomButton), for: .touchUpInside)
        
        horizontalStackView.addArrangedSubview(zoomButton)
        
        zoomButton.snp.makeConstraints { make in
            make.width.height.equalTo(42)
        }
    }
    
    private func addScanAim() {
        scanAim  = UIImageView()
        scanAim.image = UIImage(named: "focus_off_icon")
        
        self.view.addSubview(scanAim)
        
        scanAim.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(30)
        }
    }
    
    private func addScanFrame() {
        scanFrame = UIImageView()
        scanFrame.image = UIImage(named: "scan_frame_admin")
        
        self.view.addSubview(scanFrame)
        
        scanFrame.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(165)
        }
    }
    
    private func addScanFrameDot() {
        scanFrameDot = UIImageView()
        scanFrameDot.image = UIImage(named: "scan_frame_dot_admin")
        
        self.view.addSubview(scanFrameDot)
        
        scanFrameDot.snp.makeConstraints { make in
            make.left.equalTo(scanFrame.snp.right)
            make.bottom.equalTo(scanFrame.snp.top)
            make.width.height.equalTo(32)
        }
    }
    
    private func addScanTipView() {
        scanTipView = ScanTipView()
        
        self.view.addSubview(scanTipView)
        
        scanTipView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-36)
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }

    //MARK: - Selector
    @objc func goOutside(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tapTorchButton(_ sender: UIButton) {
        let currentTorchStatus: Bool = self.getCurrentTorchStatus()
        self.controlTorch(on: !currentTorchStatus)
        self.setTorchButton(value: !currentTorchStatus)
    }
    
    @objc func tapZoomButton(_ sender: UIButton) {
        let zoomStatus: Bool = (self.getCurrentZoomLevel() == .HIGH) ? true : false
        let zoomLevel: ZoomLevel = (zoomStatus) ? .NORMAL : .HIGH
        self.controlZoom(level: zoomLevel)
        self.setZoomButton(value: !zoomStatus)
    }
    
    @objc func confirmTap(sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
        self.startSession()
    }
}

//MARK: - Delegate
extension ScanViewController: DetectViewControllerProtocol {
    func abnormalExecution(reason: String) {
        
    }
    
    func getDetectResult(data: Dictionary<String, Any>) {
        
        let isAdmin = true // Admin 계정인지 확인 할 수 있게 하는 Bool 값 코드
        
        if isAdmin {
            self.playSound()
            self.playVibration()
            Task {
                scanResponse = await viewModel.getScanResponse()
                self.stopSession()
                bringPopUpView()
            }
        } else {
            self.startSession()
            //            관리자 계정이 아니었을 경우해 하는 예외처리(관리자 계정이 아니라는 팝업을 띄움)
        }
    }
}

//MARK: - Function
extension ScanViewController {
    
    private func addTapTarget() {
        scanNavigationBarView.backButton.addTarget(self, action: #selector(goOutside), for: .touchUpInside)
    }
    
    private func setTorchButton(value: Bool) {
        let torchImage: UIImage = (value) ? self.torchOnImage : self.torchoffImage
        self.torchButton.setImage(torchImage, for: .normal)
    }
    
    private func setZoomButton(value: Bool) {
        let zoomImage: UIImage = (value) ? self.zoomOnImage : self.zoomOffImage
        self.zoomButton.setImage(zoomImage, for: .normal)
    }
    
    private func bringPopUpView() {
        DispatchQueue.main.async {
            let snapShotView =  self.view.snapshotView(afterScreenUpdates: true)
            let popupViewController = PopupViewController(snapShotView: snapShotView!, scanResponse: self.scanResponse)
            popupViewController.modalPresentationStyle = .fullScreen
            popupViewController.modalTransitionStyle = .crossDissolve
            self.present(popupViewController, animated: true)
            popupViewController.succesScanPopUpView.confirmButton.addTarget(self, action: #selector(self.confirmTap), for: .touchUpInside)
        }
    }
    
    private func playSoundEvenIfMuted() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
    
    
}
