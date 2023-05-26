//
//  GetData.swift
//  jw-keefo
//
//  Created by 스냅태그 on 2023/05/23.
//

import Foundation
class Network {
    
    let url = "https://lcy.admin.snaptag.co.kr/api/responseTest/response/get/"
    
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
    
    //    func getScanData() {
    //        if let url = URL(string: url + "3") {
    //            let request = URLRequest.init(url: url)
    //
    //            URLSession.shared.dataTask(with: request) {
    //                (data, response, error) in guard let data = data else {return}
    //                let decoder = JSONDecoder()
    //                print(response as Any)
    //                do{ let json = try decoder.decode(ScanResponse.self , from: data)
    //                    print(json,"!!!")
    //                }
    //                catch{
    //                    print(error)
    //                }
    //            }.resume()
    //        }
    //    }
    
}
