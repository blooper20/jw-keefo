//
//  ScanViewModel.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/26.
//

import Foundation

class ScanViewModel {
    let network: Network = Network()
    private var scanResponse: ScanResponse!
}

extension ScanViewModel {
    func getScanResponse() async -> ScanResponse {
        scanResponse = await network.getScanData()
        guard let response = scanResponse else {
            // ScanResponse를 못 받아왔을 때의 로직 구현
            fatalError("ScanResponse를 못 받아 왔습니다.")
        }
        return response
    }
}
