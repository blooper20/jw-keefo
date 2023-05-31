//
//  SuccesScanPopUpView.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/17.
//

import UIKit
import SnapKit

class SuccesScanPopUpView: UIView {
    
    private var scanResponse: ScanResponse!
    
    //MARK: - Declaration View
    var confirmButton: UIButton!
    private var contentView: UIView!
    private var scanCheckNoticeStackView: ScanCheckNoticeStackView!
    private var ticketInfoStackView: UIStackView!
    private var ticketInfoContentStackView: TicketInfoContentStackView!
    
    
    
    //MARK: - Initialize
    convenience init(scanResponse: ScanResponse) {
        self.init()
        self.scanResponse = scanResponse
        configure()
        addContentView()
        addScanCheckNoticeStackView()
        addTicketInfoStackView()
        addTicketInfoContentStackView()
        addConfirmButton()
    }
    
    override init(frame: CGRect) {
        self.scanResponse = nil
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SuccesScanPopUpView {
    //MARK: - Configure
    func configure() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
    }
    
    func addContentView() {
        contentView = UIView()
        contentView.backgroundColor = .clear
        
        self.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(30)
            make.bottom.equalToSuperview().offset(-25)
        }
    }
    
    func addScanCheckNoticeStackView() {
        scanCheckNoticeStackView = ScanCheckNoticeStackView()
        
        self.contentView.addSubview(scanCheckNoticeStackView)
        scanCheckNoticeStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(28)
        }
    }
    
    func addTicketInfoStackView() {
        ticketInfoStackView = UIStackView()
        ticketInfoStackView.axis = .vertical
        ticketInfoStackView.spacing = 8
        ticketInfoStackView.distribution = .fillEqually
        
        self.contentView.addSubview(ticketInfoStackView)
        
        ticketInfoStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(scanCheckNoticeStackView.snp.bottom).offset(16)
        }
    }
    
    func addTicketInfoContentStackView() {
        let date = scanResponse.data?.info?.advanceReservation?.advanceReservationEventDate?[0].eventDate?.date
        let session = scanResponse.data?.info?.advanceReservation?.advanceReservationEventDate?[0].advanceReservationEventSession?[0].eventSession?.name
        guard let quantity = scanResponse.data?.info?.advanceReservation?.ticketQuantity else { return }
        let ticketType = scanResponse.data?.info?.advanceReservation?.ticketType
        let notes = scanResponse.data?.info?.advanceReservation?.notes ?? "없음"
        
        let ticketInfoArray: [(String, String?)] = [
            ("일자", date),
            ("세션", session),
            ("수량", String(quantity)),
            ("티켓유형", ticketType),
            ("참고사항", notes)
        ]
        
        ticketInfoArray.forEach { (title, content) in
            guard let content = content else { return }
            ticketInfoContentStackView = TicketInfoContentStackView(title: title, content: content)
            
            self.ticketInfoStackView.addArrangedSubview(ticketInfoContentStackView)
        }
        
    }
    
    
    func addConfirmButton() {
        confirmButton = UIButton()
        
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        confirmButton.titleLabel?.textColor = .white
        
        confirmButton.backgroundColor = .black
        
        confirmButton.layer.cornerRadius = 11
        confirmButton.layer.masksToBounds = true
        
        self.contentView.addSubview(confirmButton)
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(ticketInfoStackView.snp.bottom).offset(28)
            make.bottom.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    
}
