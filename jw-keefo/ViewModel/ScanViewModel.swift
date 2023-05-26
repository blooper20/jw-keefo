//
//  ScanViewModel.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/26.
//

import Foundation

class ScanViewModel {
    let network: Network = Network()
    private var scanResponse: ScanResponse?
}
extension ScanViewModel {
    func getCheckingTicket() {
        Task {
            scanResponse = await network.getScanData()
            guard let scanResponse = scanResponse else { return }
            if scanResponse.statusCode == 200 {
                print("<Ticket> Verification")
                binding(scanResponse: scanResponse)
            } else {
                print("에러 처리")
            }
        }
    }
    
    func binding(scanResponse: ScanResponse) {
        guard let date = scanResponse.data?.info?.advanceReservation?.advanceReservationEventDate?[0].eventDate?.date else { return }
        guard let sessionName = scanResponse.data?.info?.advanceReservation?.advanceReservationEventDate?[0].advanceReservationEventSession?[0].eventSession?.name else { return }
        guard let ticketQuantity = scanResponse.data?.info?.advanceReservation?.ticketQuantity else { return }
        guard let ticketType = scanResponse.data?.info?.advanceReservation?.ticketType else { return }
        guard let notes = scanResponse.data?.info?.advanceReservation?.notes else { return } // nil이 들어올 때 대비가 안되어있음
        
        
        print(date, sessionName, ticketQuantity, ticketType, notes,"!!!!!!")
        // API로 통신해온 값을 필요에 맞게 특정 변수에 저장 한 후에 팝업을 띄우는 기능 구현
    }
}
