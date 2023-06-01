//
//  GetData.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation
class Network {
    
    let url = "https://lcy.admin.snaptag.co.kr/api/responseTest/response/get/"
    
    //MARK: - 이벤트 뉴스에 관한 Json 파싱
    func getNewsData() async -> NewsResponse? {
        guard let url = URL(string: url + "1") else { return nil }
        let request = URLRequest.init(url: url)
        do {
            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(NewsResponse.self, from: result.data)
        } catch {
            return nil
        }
    }
    
    //MARK: - 유저에 관한 Json 파싱
    func getUserData() async -> UserResponse? {
        guard let url = URL(string: url + "2") else { return nil }
        let request = URLRequest.init(url: url)
        do {
            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(UserResponse.self, from: result.data)
        } catch {
            return nil
        }
    }
    
    //MARK: - Scan 했을 때 넘어오는 정보들에 관한 Json 파싱
    func getScanData() async -> ScanResponse? {
        guard let url = URL(string: url + "3") else { return nil }
        let request = URLRequest.init(url: url)
        do {
            let result:(data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(ScanResponse.self, from: result.data)
        } catch {
            return nil
        }
    }
}
